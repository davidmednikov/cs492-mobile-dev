import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'lib/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
  runApp(CallMeMaybe());
}

class CallMeMaybe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CallMeMaybe',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MainScreen(title: 'Call Me Maybe'),
    );
  }
}