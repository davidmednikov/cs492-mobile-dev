import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneNumber extends StatelessWidget {

  final String phoneNumber;
  
  const PhoneNumber({Key key, this.phoneNumber }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: padding(context)),
      child: GestureDetector(
        onTap: openMessaging,
        child: Text(
          phoneNumber,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  double padding(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.03;
    }
    return MediaQuery.of(context).size.height * 0.05;
  }

  void openMessaging() async {
    var smsNumber = 'sms:$phoneNumber';
    if (await canLaunch(smsNumber)) {
      await launch(smsNumber);
    } else {
      throw 'Could not launch $smsNumber';
    }
  }

}