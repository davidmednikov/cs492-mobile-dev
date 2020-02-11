import 'package:flutter/material.dart';

class ResumeEntryCaption extends StatelessWidget {

  final String company;
  final String dates;
  final String location;

  const ResumeEntryCaption({Key key, this.company, this.dates, this.location }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding(context)),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                company,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                dates,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                location,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      )
    );
  }

  double bottomPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.001;
    }
    return MediaQuery.of(context).size.height * 0.01;
  }
}