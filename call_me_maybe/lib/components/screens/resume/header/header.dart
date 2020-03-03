import 'package:flutter/material.dart';
import 'header_email.dart';
import 'header_github.dart';
import 'header_name.dart';

class Header extends StatelessWidget {

  final String name;
  final String email;
  final String github;

  const Header({Key key, this.name, this.email, this.github }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: topPadding(context), bottom: bottomPadding(context), left: leftPadding(context)),
      child: Column(
        children: [
          HeaderName(name: name),
          HeaderEmail(email: email),
          HeaderGithub(github: github),
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
    return MediaQuery.of(context).size.height * 0.01;
  }

  double leftPadding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width * 0.02;
    }
    return MediaQuery.of(context).size.width * 0.01;
  }
}