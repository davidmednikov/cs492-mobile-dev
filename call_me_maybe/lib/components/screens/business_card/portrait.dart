import 'package:flutter/material.dart';

class Portrait extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding(context)),
      child: SizedBox(
        width: 100, height: 100,
        child: ClipOval(
          child: Image.asset('assets/img/portrait.jpg'),
        ),
      ),
    );
  }

  double padding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.025;
    }
    return MediaQuery.of(context).size.height * 0.03;
  }
}