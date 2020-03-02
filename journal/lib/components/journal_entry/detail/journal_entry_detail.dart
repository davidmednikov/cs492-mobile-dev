import 'package:flutter/material.dart';
import '../../models/journal_entry_model.dart';

class JournalEntryDetail extends StatelessWidget {

  JournalEntryModel entry;

  JournalEntryDetail({Key key, this.entry }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (entry == null) {
      entry = ModalRoute.of(context).settings.arguments;
    }
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(entry.title, style: TextStyle(fontSize: 36)),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Text(entry.body, style: TextStyle(fontSize: 12)),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Text('Rating: ${entry.rating}', style: TextStyle(fontSize: 12)),
              )
            ],
          ),
        ],
      ),
    );
  }
}