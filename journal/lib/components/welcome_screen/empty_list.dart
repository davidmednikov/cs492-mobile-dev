import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.rate_review,
              size: 75.0,
              color: Colors.black54,
            ),
            Text('Journal', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}