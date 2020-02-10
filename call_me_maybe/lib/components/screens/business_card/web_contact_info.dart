import 'package:flutter/material.dart';
import 'email.dart';
import 'github.dart';

class WebContactInfo extends StatelessWidget {

  final String github;
  final String email;

  const WebContactInfo({Key key, this.github, this.email }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Github(github: github),
            ],
          ),
          Column(
            children: [
              Email(email: email),
            ],
          ),
        ],
      ),
    );
  }
}