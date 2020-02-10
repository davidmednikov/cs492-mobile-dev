import 'package:flutter/material.dart';
import 'phone_number.dart';
import 'web_contact_info.dart';

class ContactInfo extends StatelessWidget {

  final String email;
  final String github;
  final String phoneNumber;
  
  const ContactInfo({Key key, this.phoneNumber, this.github, this.email }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [ PhoneNumber(phoneNumber: phoneNumber) ],
          ),
          Row(
            children: [ WebContactInfo(github: github, email: email) ],
          )
        ],
      ),
    );
  }
}