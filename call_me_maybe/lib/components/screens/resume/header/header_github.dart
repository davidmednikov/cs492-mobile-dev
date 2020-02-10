import 'package:flutter/material.dart';

class HeaderGithub extends StatelessWidget {

  final String github;

  const HeaderGithub({Key key, this.github }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            'https://$github',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}