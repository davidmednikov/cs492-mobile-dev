import 'package:flutter/material.dart';

class Resume extends StatefulWidget {

  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {

  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Placeholder(),
            ],
          ),
        ],
      ),
    );
  }
}