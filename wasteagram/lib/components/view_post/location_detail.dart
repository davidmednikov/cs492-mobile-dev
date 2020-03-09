import 'package:flutter/material.dart';

class LocationDetail extends StatelessWidget {

  double latitude;
  double longitude;

  LocationDetail({Key key, this.latitude, this.longitude}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                '($latitude, $longitude)',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}