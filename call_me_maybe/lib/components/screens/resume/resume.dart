import 'package:flutter/material.dart';
import 'header/header.dart';
import 'body/resume_body.dart';

class Resume extends StatelessWidget {

  final experience = [
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - Current",
        "location": "Los Angeles, CA",
        "description": "Code this shit all day every day."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Flexible(
                child: Header(name: 'David Mednikov', email: 'mednikod@oregonstate.edu', github: 'github.com/davidmednikov'),
              ),
            ],
          ),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: ResumeBody(experience: this.experience),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}