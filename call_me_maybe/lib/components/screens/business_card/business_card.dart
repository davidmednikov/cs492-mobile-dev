import 'package:flutter/material.dart';
import 'contact_info.dart';
import 'name.dart';
import 'portrait.dart';
import 'description.dart';

class BusinessCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Portrait(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Name(name: 'David Mednikov'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Description(description: 'Creator Of Worlds'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContactInfo(
                phoneNumber: '818-687-2962',
                github: 'github.com/davidmednikov',
                email: 'mednikod@oregonstate.edu'
              ),
            ],
          ),
        ],
      ),
    );
  }
}