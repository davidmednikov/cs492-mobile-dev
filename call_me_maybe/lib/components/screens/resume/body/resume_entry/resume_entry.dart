import 'package:flutter/material.dart';
import 'caption.dart';
import 'description.dart';
import 'title.dart';

class ResumeEntry extends StatelessWidget {

  final String title;
  final String company;
  final String dates;
  final String location;
  final String description;

  const ResumeEntry({Key key, this.title, this.company, this.dates, this.location, this.description }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ResumeEntryTitle(title: title),
          ResumeEntryCaption(company: company, dates: dates, location: location),
          ResumeEntryDescription(description: description),
        ],
      ),
    );
  }

  double verticalPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.0075;
    }
    return MediaQuery.of(context).size.height * 0.01;
  }
}