import 'package:flutter/material.dart';
import 'resume_entry_caption.dart';
import 'resume_entry_description.dart';
import 'resume_entry_title.dart';

class ResumeEntry extends StatelessWidget {

  final String title;
  final String company;
  final String dates;
  final String location;
  final String description;

  const ResumeEntry({Key key, this.title, this.company, this.dates, this.location, this.description }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: topPadding(context), bottom: bottomPadding(context), left: leftPadding(context)),
      child: Column(
        children: [
          ResumeEntryTitle(title: title),
          ResumeEntryCaption(company: company, dates: dates, location: location),
          ResumeEntryDescription(description: description),
        ],
      )
    );
  }

  double topPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.03;
    }
    return MediaQuery.of(context).size.height * 0.04;
  }

  double bottomPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.025;
    }
    return MediaQuery.of(context).size.height * 0.04;
  }

  double leftPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width * 0.02;
    }
    return MediaQuery.of(context).size.width * 0.01;
  }
}