import 'package:flutter/material.dart';

class ResumeEntryLocation extends StatelessWidget {

  final String location;

  const ResumeEntryLocation({Key key, this.location }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        location,
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 16, fontFamily: 'Garamond', color: Color(0xff5d5c5e)),
      ),
    );
  }
}
