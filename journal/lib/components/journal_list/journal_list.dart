import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:master_detail_scaffold/master_detail_scaffold.dart';
import '../models/journal_entry_model.dart';
import '../models/journal_model.dart';

DateFormat dateFormat = DateFormat('EEEE, MMMM dd, yyyy');

class JournalList extends StatelessWidget {

  JournalModel journalModel;

  JournalList({Key key, this.journalModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: convertEntriesToListTiles(journalModel.entries, context),
              shrinkWrap: true,
            ),
          ),
        ],
      )
    );
  }

  List<ListTile> convertEntriesToListTiles(List<JournalEntryModel> entries, BuildContext context) {
    List<ListTile> listTiles = new List<ListTile>();
    entries.forEach( (entry) {
      ListTile tile = ListTile(
        title: Text(entry.title),
        subtitle: Text(dateFormat.format(entry.date)),
        onTap: () {
          MasterDetailScaffold.of(context).detailsPaneNavigator.pushNamedAndRemoveUntil('view?id=${entry.id}', ModalRoute.withName('/'));
        },
      );
      listTiles.add(tile);
    });
    return listTiles;
  }
}

