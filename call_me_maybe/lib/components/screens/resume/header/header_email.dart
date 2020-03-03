import 'package:flutter/material.dart';

class HeaderEmail extends StatelessWidget {

  final String email;

  const HeaderEmail({Key key, this.email }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding(context) ),
      child: Row(
        children: [
          Text(
            email,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontFamily: 'Garamond', fontWeight: FontWeight.bold, color: Color(0xff5d5c5e)),
          ),
        ],
      ),    );
  }

  double bottomPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.001;
    }
    return MediaQuery.of(context).size.height * 0.005;
  }
}