import 'package:flutter/material.dart';

class Description extends StatelessWidget {

  final String description;

  const Description({Key key, this.description }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: topPadding(context), bottom: bottomPadding(context) ),
      child: Text(
        description,
        style: TextStyle(fontSize: 20, fontFamily: 'Garamond', color: Color(0xff5d5c5e)),
      ),
    );
  }

  double topPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.025;
    }
    return MediaQuery.of(context).size.height * 0.02;
  }

  double bottomPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.025;
    }
    return MediaQuery.of(context).size.height * 0.04;
  }
}