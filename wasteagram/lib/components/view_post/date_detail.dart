import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat('EEEE, LLL. d yyyy');

class DateDetail extends StatelessWidget {

  DateTime date;

  DateDetail({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                dateFormat.format(date),
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
        ),
      ],
    );
  }
}