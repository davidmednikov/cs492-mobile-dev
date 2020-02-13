import 'package:flutter/material.dart';

class Prompt extends StatelessWidget {

  final String prompt;

  const Prompt({Key key, this.prompt }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: topPadding(context), bottom: bottomPadding(context) ),
      child: Text(
        prompt,
        style: TextStyle(fontSize: 32, fontFamily: 'Afternoon', color: Color(0xff5d5c5e)),
      ),
    );
  }

  double topPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.25;
    }
    return MediaQuery.of(context).size.height * 0.1;
  }

  double bottomPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.05;
    }
    return MediaQuery.of(context).size.height * 0.075;
  }
}