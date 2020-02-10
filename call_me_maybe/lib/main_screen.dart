import 'package:flutter/material.dart';
import 'components/tab_nav_controller.dart';

class MainScreen extends StatelessWidget {

  final String title;

  MainScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabNavController(title: title);
  }
}