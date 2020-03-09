import 'dart:io';
import 'package:flutter/material.dart';

class SelectedImage extends StatelessWidget {

  File image;

  SelectedImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Image(
              image: FileImage(image),
            ),
          ),
        ),
      ],
    );
  }
}