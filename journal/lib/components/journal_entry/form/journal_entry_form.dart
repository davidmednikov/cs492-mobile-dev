import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/journal_entry_model.dart';
import '../../models/journal_model.dart';
import 'cancel_button.dart';

const INSERT_PATH = 'lib/assets/insert.txt';

class JournalEntryForm extends StatefulWidget {
  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {

  final formKey = GlobalKey<FormState>();
  final journalEntryModel = JournalEntryModel();

  JournalModel journalModel = JournalModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListView(
        children: [
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    journalEntryModel.title = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  }
                ),
                SizedBox(height: 10),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Body',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    journalEntryModel.body = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a body';
                    }
                    return null;
                  }
                ),
                SizedBox(height: 10),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Rating',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                  ],
                  onSaved: (value) {
                    journalEntryModel.rating = int.parse(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a rating';
                    } else if (int.tryParse(value) == null) {
                      return 'Rating must be a number';
                    } else {
                      int rating = int.parse(value);
                      if (rating < 1 || rating > 4) {
                        return 'Rating must be between 1 and 4';
                      }
                    }
                    return null;
                  }
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CancelButton(),
                      ],
                    ),
                    Column(
                      children: [
                        RaisedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              String dbInsert = await rootBundle.loadString(INSERT_PATH);
                              var db = await openDatabase('journal.sqlite3.db');
                              await db.transaction( (txn) async {
                                await txn.rawInsert(dbInsert,
                                  [journalEntryModel.title, journalEntryModel.body, journalEntryModel.rating, new DateTime.now().toString()]
                                );
                              });
                              await db.close();
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text('Save Entry'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}