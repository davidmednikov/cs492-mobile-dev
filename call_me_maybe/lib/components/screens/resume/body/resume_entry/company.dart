import 'package:flutter/material.dart';

class ResumeEntryCompany extends StatelessWidget {

  final String company;

  const ResumeEntryCompany({Key key, this.company }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        company,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16, fontFamily: 'Garamond', color: Color(0xff5d5c5e)),
      ),
    );
  }
}
