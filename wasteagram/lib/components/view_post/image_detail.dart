import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {

  String imageURL;

  ImageDetail({Key key, this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Image(
              image: NetworkImage(imageURL),
            ),
          ),
        ),
      ],
    );
  }
}