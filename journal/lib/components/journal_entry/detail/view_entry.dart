import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/scaffold_app_bar.dart';
import '../../common/dark_mode_drawer.dart';
import '../../models/journal_entry_model.dart';
import 'journal_entry_detail.dart';

DateFormat dateFormat = DateFormat('MMMM dd, yyyy');

class ViewEntry extends StatelessWidget {

  JournalEntryModel journalEntry;

  SharedPreferences preferences;

  ViewEntry({Key key, this.preferences, this.journalEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.journalEntry == null) {
      journalEntry = ModalRoute.of(context).settings.arguments;
    }
    return Scaffold(
      appBar: ScaffoldAppBar(title: dateFormat.format(journalEntry.date)),
      body: SafeArea(
        child: JournalEntryDetail(entry: journalEntry),
      ),
      endDrawer: DarkModeDrawer(preferences: preferences),
    );
  }
}