import 'package:flutter/material.dart';

class ResumeEntryDescription extends StatelessWidget {

  final String description;

  const ResumeEntryDescription({Key key, this.description }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding(context)),
      child: Row(
        children: [
          Text(
            description,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      )
    );
  }

  double bottomPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.025;
    }
    return MediaQuery.of(context).size.height * 0.04;
  }
}