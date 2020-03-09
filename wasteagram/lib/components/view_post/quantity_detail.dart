import 'package:flutter/material.dart';

class QuantityDetail extends StatelessWidget {

  int quantity;

  QuantityDetail({Key key, this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Items: $quantity',
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
        ),
      ],
    );
  }
}