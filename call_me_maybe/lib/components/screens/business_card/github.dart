import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Github extends StatelessWidget {

  final String github;

  const Github({Key key, this.github }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: openUrl,
        child: Text(
          github,
          style: TextStyle(fontSize: 16, fontFamily: 'Garamond', fontWeight: FontWeight.bold, color: Color(0xff5d5c5e)),
        ),
      )
    );
  }

  void openUrl() async {
    var httpUrl = 'http:$github';
    if (await canLaunch(httpUrl)) {
      await launch(httpUrl);
    } else {
      throw 'Could not launch $httpUrl';
    }
  }

}