import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Email extends StatelessWidget {

  final String email;
  
  const Email({Key key, this.email }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0),
      child: GestureDetector(
        onTap: openEmail,
        child: Text(
          email,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void openEmail() async {
    var mailtoEmail = 'mailto:$email?subject=You%20Are%20The%20Greatest%20Developer%20Ever.';
    if (await canLaunch(mailtoEmail)) {
      await launch(mailtoEmail);
    } else {
      throw 'Could not launch $mailtoEmail';
    }
  }

}