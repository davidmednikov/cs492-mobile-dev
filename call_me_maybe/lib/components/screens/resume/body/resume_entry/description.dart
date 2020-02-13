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
          Flexible(
            child: Text(
              description,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14, fontFamily: 'Garamond', color: Color(0xff5d5c5e)),
            ),
          ),
        ],
      )
    );
  }

  double bottomPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.002;
    }
    return MediaQuery.of(context).size.height * 0.04;
  }
}