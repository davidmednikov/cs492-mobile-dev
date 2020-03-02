import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class DarkModeDrawer extends StatefulWidget {

  SharedPreferences preferences;

  DarkModeDrawer({Key key, this.preferences}) : super(key: key);

  @override
  _DarkModeDrawerState createState() => _DarkModeDrawerState();
}

class _DarkModeDrawerState extends State<DarkModeDrawer> {

  bool darkMode;


  void initState() {
    super.initState();
    darkMode = widget.preferences.getBool('darkMode') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 75.0,
            child: DrawerHeader(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('Settings'),
              ),
            ),
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: darkMode,
            onChanged: (value) {
              toggleDarkMode(context);
            },
          ),
        ],
      ),
    );
  }

  void toggleDarkMode(BuildContext context) {
    bool isDarkMode = widget.preferences.getBool('darkMode') ?? false;
    setState( () { darkMode = !darkMode; } );
    widget.preferences.setBool('darkMode', !isDarkMode);
    context.ancestorStateOfType(TypeMatcher<JournalState>()).setState(() {});
  }
}