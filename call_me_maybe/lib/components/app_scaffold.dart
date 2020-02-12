import 'package:flutter/material.dart';
import 'screens/business_card/business_card.dart';
import 'screens/predictor/predictor.dart';
import 'screens/resume/resume.dart';

class AppScaffold extends StatelessWidget {

  final String title;

  final List tabs;

  final screens = [ BusinessCard(), Resume(), Predictor() ];

  AppScaffold({Key key, this.title, this.tabs }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(title),
        ),
        backgroundColor: Color(0xff54b0f3),
        bottom: TabBar(tabs: tabs),
      ),
      body: TabBarView(
        children: screens,
      ),
      backgroundColor: Color(0xffeef3f9),
    );
  }
}