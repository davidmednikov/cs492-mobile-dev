import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {

  final String instructions;

  const Instructions({Key key, this.instructions }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        instructions,
        style: TextStyle(fontSize: 20, fontFamily: 'Eminenz', fontWeight: FontWeight.bold, color: Color(0xff5d5c5e)),
        textAlign: TextAlign.center,
      ),
    );
  }
}