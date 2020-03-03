import 'package:flutter/material.dart';
import 'resume_entry/resume_entry.dart';

class ResumeBody extends StatelessWidget {

  final List<Map> experience;

  ResumeBody({Key key, this.experience }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalPadding(context), horizontal: horizontalPadding(context)),
      child: Column(
        children: createResumeEntries(experience),
      ),
    );
  }

  List<ResumeEntry> createResumeEntries(experience) {
    return experience.map<ResumeEntry>( (entry) {
      return ResumeEntry( title: entry['title'], company: entry['company'],
      dates: entry['dates'], location: entry['location'], description: entry['description']);
    }).toList();
  }

  double verticalPadding(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.005;
  }

  double horizontalPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width * 0.02;
    }
    return MediaQuery.of(context).size.width * 0.01;
  }
}