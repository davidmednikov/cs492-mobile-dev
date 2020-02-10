import 'package:flutter/material.dart';

class HeaderName extends StatelessWidget {

  final String name;

  const HeaderName({Key key, this.name }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding(context) ),
      child: Row(
        children: [
          Text(
            name,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 26),
          ),
        ],
      ),    );
  }

  double bottomPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.002;
    }
    return MediaQuery.of(context).size.height * 0.005;
  }
}