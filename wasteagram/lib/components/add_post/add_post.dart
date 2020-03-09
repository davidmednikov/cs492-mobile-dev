import 'dart:io';
import 'package:flutter/material.dart';
import 'add_post_form.dart';

class AddPost extends StatelessWidget {

  File image;

  @override
  Widget build(BuildContext context) {
    image = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Wasteagram'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: AddPostForm(image: image),
        ),
      ),
    );
  }
}