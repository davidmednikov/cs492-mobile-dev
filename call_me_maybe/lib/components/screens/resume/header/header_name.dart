import 'package:flutter/material.dart';

class HeaderName extends StatelessWidget {

  final String name;

  const HeaderName({Key key, this.name }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            name,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 28, fontFamily: 'Garamond', fontWeight: FontWeight.bold, color: Color(0xff5d5c5e)),
          ),
        ],
      ),    );
  }
}