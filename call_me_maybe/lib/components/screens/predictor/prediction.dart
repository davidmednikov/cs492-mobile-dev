import 'package:flutter/material.dart';

class Prediction extends StatelessWidget {

  final String prediction;

  const Prediction({Key key, this.prediction }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: topPadding(context), left: sidePadding(context), right: sidePadding(context)),
      child: Text(
        prediction,
        style: TextStyle(fontSize: 26, fontFamily: 'Autobus', color: Color(0xff5d5c5e)),
        textAlign: TextAlign.center,
      ),
    );
  }

  double topPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.06;
    }
    return MediaQuery.of(context).size.height * 0.075;
  }

  double sidePadding(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.05;
  }
}