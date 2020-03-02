import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/scaffold_app_bar.dart';
import '../../common/dark_mode_drawer.dart';
import 'journal_entry_form.dart';

class NewEntry extends StatelessWidget {

  SharedPreferences preferences;

  NewEntry({Key key, this.preferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScaffoldAppBar(title: 'New Journal Entry'),
      body: SafeArea(
        child: JournalEntryForm(),
      ),
      endDrawer: DarkModeDrawer(preferences: preferences),
    );
  }
}