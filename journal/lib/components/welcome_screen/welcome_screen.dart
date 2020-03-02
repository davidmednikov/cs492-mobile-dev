import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:master_detail_scaffold/master_detail_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/scaffold_app_bar.dart';
import '../common/dark_mode_drawer.dart';
import '../journal_entry/detail/journal_entry_detail.dart';
import '../journal_entry/form/new_entry.dart';
import '../journal_list/journal_list.dart';
import '../models/journal_entry_model.dart';
import '../models/journal_model.dart';
import 'empty_list.dart';

DateFormat parseDateFormat = DateFormat('yyyy-MM-dd HH:mm:ss.SSSS');
DateFormat printDateFormat = DateFormat('MMMM dd, yyyy');

const GET_ALL_PATH = 'lib/assets/get_all.txt';
const GET_ENTRY_PATH = 'lib/assets/get_entry.txt';

class WelcomeScreen extends StatefulWidget {

  SharedPreferences preferences;

  WelcomeScreen({Key key, this.preferences}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  JournalModel journalModel;

  JournalEntryModel journalEntry;

  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    String dbGetAll = await rootBundle.loadString(GET_ALL_PATH);
    Database db = await openDatabase('journal.sqlite3.db');
    List<Map> journalEntries = await db.rawQuery(dbGetAll);
    await db.close();
    List<JournalEntryModel> entryList = journalEntries.map( (record) {
      return JournalEntryModel(
        id: record['id'],
        title: record['title'],
        body: record['body'],
        rating: record['rating'],
        date: parseDateFormat.parse(record['date']),
      );
    }).toList();
    setState( () {
      journalModel = JournalModel(entries: entryList);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (journalModel == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Welcome')),
        body: EmptyList(),
      );
    }
    return MasterDetailScaffold(
      initialAppBar: ScaffoldAppBar(title: journalModel.entries.length == 0 ? 'Welcome' : 'Journal Entries'),
      detailsAppBar: ScaffoldAppBar(title: journalEntry != null ? printDateFormat.format(journalEntry.date) : 'Journal Entries'),
      masterPaneBuilder: Builder(
        builder: (context) => showIconOrList(context),
      ).builder,
      detailsPaneBuilder: (context) => JournalEntryDetail(entry: journalEntry),
      initialRoute: '/',
      detailsRoute: 'view',
      onDetailsPaneRouteChanged:
      (String route, Map<String, String> parameters) {
        setState(() {
          if (route == 'view') {
            journalEntry = journalModel.getJournalEntry(int.parse(parameters['id']));
          } else {
            loadJournal();
          }
        });
      },
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).orientation == Orientation.landscape,
        child: FloatingActionButton(
          onPressed:() {
            Navigator.of(context).pushNamed('new');
          },
          child: Icon(Icons.add),
        ),
      ),
      endDrawer: DarkModeDrawer(preferences: widget.preferences),
      twoPanesWidthBreakpoint: 500,
      masterPaneWidth: 250,
    );
  }

  Widget addButtonIfNeeded(BuildContext context, Widget masterDisplay) {
    if(MediaQuery.of(context).orientation == Orientation.portrait) {
      return Stack(
        children: [
          masterDisplay,
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: FloatingActionButton(
                onPressed:() {
                  MasterDetailScaffold.of(context).detailsPaneNavigator.push(
                    MaterialPageRoute(
                      builder: (context) => NewEntry(preferences: widget.preferences),
                      settings: RouteSettings(
                        name: 'new',
                      ),
                    ),
                  );
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      );
    }
    return masterDisplay;
  }

  Widget showIconOrList(BuildContext context) {
    if (journalModel.entries.length == 0) {
      return addButtonIfNeeded(context, EmptyList());
    }
    return addButtonIfNeeded(context, JournalList(journalModel: journalModel));
  }
}