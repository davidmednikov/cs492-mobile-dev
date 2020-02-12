import 'package:flutter/material.dart';

class ResumeEntryDates extends StatelessWidget {

  final String dates;

  const ResumeEntryDates({Key key, this.dates }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        dates,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontFamily: 'Garamond', color: Color(0xff5d5c5e)),
      ),
    );
  }
}
