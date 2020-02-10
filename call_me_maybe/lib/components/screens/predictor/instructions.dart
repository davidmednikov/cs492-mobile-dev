import 'package:flutter/material.dart';

class Instructions extends StatelessWidget {

  final String instructions;

  const Instructions({Key key, this.instructions }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        instructions,
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}