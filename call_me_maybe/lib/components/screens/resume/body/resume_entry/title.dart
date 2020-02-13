import 'package:flutter/material.dart';

class ResumeEntryTitle extends StatelessWidget {

  final String title;

  const ResumeEntryTitle({Key key, this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding(context)),
      child: Row(
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17, fontFamily: 'Garamond', fontWeight: FontWeight.bold, color: Color(0xff5d5c5e)),
          ),
        ],
      )
    );
  }

  double bottomPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.002;
    }
    return MediaQuery.of(context).size.height * 0.01;
  }
}