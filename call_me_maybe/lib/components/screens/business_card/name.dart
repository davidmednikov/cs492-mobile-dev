import 'package:flutter/material.dart';

class Name extends StatelessWidget {

  final String name;

  const Name({Key key, this.name }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        name,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}