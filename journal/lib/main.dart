import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/journal_entry/detail/view_entry.dart';
import 'components/journal_entry/form/new_entry.dart';
import 'components/welcome_screen/welcome_screen.dart';

const SCHEMA_PATH = 'lib/assets/schema.txt';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
  String dbSchema = await rootBundle.loadString(SCHEMA_PATH);
  // await deleteDatabase('journal.sqlite3.db');
  Database database = await openDatabase(
    'journal.sqlite3.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(dbSchema);
    }
  );
  await database.close();
  runApp(Journal(preferences: await SharedPreferences.getInstance()));
}

class Journal extends StatefulWidget {
  SharedPreferences preferences;

  Journal({Key key, this.preferences}) : super(key: key);

  @override
  JournalState createState() => JournalState();
}

class JournalState extends State<Journal> {

  bool get darkMode => widget.preferences.getBool('darkMode') ?? false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      theme: getThemeData(),
      routes: getRoutes(),
      initialRoute: '/',
    );
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => WelcomeScreen(preferences: widget.preferences),
      'new': (context) => NewEntry(preferences: widget.preferences),
      'view': (context) => ViewEntry(preferences: widget.preferences),
    };
  }

  ThemeData getThemeData() {
    if (widget.preferences.getBool('darkMode') != null && widget.preferences.getBool('darkMode') == true) {
      return ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      );
    }
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.teal,
    );
  }
}