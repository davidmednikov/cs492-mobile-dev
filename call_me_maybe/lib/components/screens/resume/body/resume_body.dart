import 'package:flutter/material.dart';
import 'resume_entry.dart';
import 'resume_experience.dart';

class ResumeBody extends StatelessWidget {

  final List<Map> experience;

  ResumeBody({Key key, this.experience }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: topPadding(context), bottom: bottomPadding(context), left: leftPadding(context)),
      child: ResumeExperience(experience: createResumeEntries(experience)),
    );
  }

  List<ResumeEntry> createResumeEntries(experience) {
    return experience.map<ResumeEntry>( (entry) {
      print(entry);
      return ResumeEntry( title: entry['title'], company: entry['company'],
      dates: entry['dates'], location: entry['location'], description: entry['description']);
    }).toList();
  }

  double topPadding(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.015;
  }

  double bottomPadding(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.02;
  }

  double leftPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width * 0.02;
    }
    return MediaQuery.of(context).size.width * 0.01;
  }
}