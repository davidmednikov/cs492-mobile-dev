import 'package:flutter/material.dart';
import '../models/post_model.dart';
import 'date_detail.dart';
import 'image_detail.dart';
import 'location_detail.dart';
import 'quantity_detail.dart';

class ViewPost extends StatelessWidget {

  PostModel post;

  ViewPost({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    post = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Wasteagram'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: ListView(
            children: [
              Column(
                children: [
                  DateDetail(date: post.date),
                  ImageDetail(imageURL: post.imageURL),
                  QuantityDetail(quantity: post.quantity),
                  LocationDetail(latitude: post.latitude, longitude: post.longitude),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}