import 'package:flutter/material.dart';
import 'header/header.dart';
import 'body/resume_body.dart';

class Resume extends StatelessWidget {

  final experience = [
    {
        "title": "Full Stack Software Engineer",
        "company": "GlobalWide Media",
        "dates": "02/2020 - Current",
        "location": "Los Angeles, CA",
        "description": "Design and develop internal full-stack web applications in:\n"
        "• MySQL / Java Springtools / Python Django / VueJS stack \n"
        "• CodeIgniter PHP / JavaScript stack with MySQL database\n"
        "• Automate billing for hundreds of millions of dollars in revenue\n"
        "• Refactor existing Java code to utilize new featurs"
    },
    {
        "title": "Junior Software Engineer",
        "company": "GlobalWide Media",
        "dates": "04/2018 - 02/2020",
        "location": "Los Angeles, CA",
        "description": "Develop internal web applications in:\n"
        "• Java Spring backend, Python Django middle layer, VueJS frontend\n"
        "• Design and write unit tests for Java backend\n"
        "• Implement consistent logging on all platforms\n"
        "• Author documentation for Python middle layer"
    },
    {
        "title": "Integration Systems Engineer",
        "company": "MeridianLink",
        "dates": "07/2017 - 04/2018",
        "location": "Costa Mesa, CA",
        "description": "Direct and torubleshoot software integrations with partner vendors\n"
        "• Work with APIs and documentation for new integrations\n"
        "• Parse JSON and XML documents for potential errors\n"
        "• Identify bugs, review code, engineer fixes & workaround solutions\n"
        "• Meet with clients, enable integrations, handle support tickets"
    },
    {
        "title": "Customer Productivity Engineer",
        "company": "MeridianLink",
        "dates": "06/2016 - 07/2017",
        "location": "Costa Mesa, CA",
        "description": "Main point of contact for client support and other inquiries\n"
        "• Answer emails, chats, and phone calls regarding our mortgage LOS\n"
        "• Improve customer efficiency and engineer workaround solutions\n"
        "• Implement 2FA on company-wide with weekly meetings\n"
        "• Improve customer efficiency and engineer workaround solutions"
    },
    {
        "title": "Office Manager",
        "company": "Plan Check Kitchen",
        "dates": "01/2016 - 04/2016",
        "location": "Los Angeles, CA",
        "description": "Essentially serve as the owner/CEO's slave\n"
        "• Fill the gas on his \$100,000 car because he wasy lazy\n"
        "• Take stuff out of his \$100,000 car\n"
        "• Put stuff back in his \$100,000 car\n"
        "• Pick up his lunch, he never bought mine once\n"
        "• Sell his crap on LetGo and OfferUp"
    },
    {
        "title": "Legal Assistant",
        "company": "Paris & Paris",
        "dates": "06/2015 - 09/2015",
        "location": "Santa Monica, CA",
        "description": "Really tedious legal work\n"
        "• Filling out writs and sorting stuff alphabetically by hand\n"
        "• This was when I leaned I didn't want to be a lawyer\n"
        "• Improved efficiency by making things electronic"
    },
    {
        "title": "Legal Assistant",
        "company": "SRF Attorneys",
        "dates": "01/2014 - 08/2014",
        "location": "Santa Monica, CA",
        "description": "Pretty interesting legal work\n"
        "• Fixing broken tech and doing legal assistant tasks on the computer\n"
        "• This was when I thought I might want to be a lawyer\n"
        "• Learned all the good lunch spots in Santa Monica"
    }
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