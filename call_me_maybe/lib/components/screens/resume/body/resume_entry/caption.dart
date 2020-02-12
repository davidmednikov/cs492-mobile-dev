import 'package:flutter/material.dart';
import 'company.dart';
import 'dates.dart';
import 'location.dart';

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
          Expanded(
            child: Column(
              children: [
                ResumeEntryCompany(company: company),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ResumeEntryDates(dates: dates),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                ResumeEntryLocation(location: location),
              ],
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
    return MediaQuery.of(context).size.height * 0.01;
  }
}