import 'package:flutter/material.dart';
import 'resume_entry.dart';

class ResumeExperience extends StatelessWidget {

  final List<ResumeEntry> experience;

  const ResumeExperience({Key key, this.experience }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(bottom: bottomPadding(context)),
      child: GridView.count(
        crossAxisCount: 1,
        shrinkWrap: true,
        children: [
          Column(
            children: experience,
          ),
        ],
      ),
    );
  }
}