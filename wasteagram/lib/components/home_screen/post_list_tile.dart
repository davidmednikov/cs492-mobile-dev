import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/post_model.dart';

DateFormat dateFormat = DateFormat('EEEE, LLL. d');

class PostListTile extends StatelessWidget {

  PostModel post;

  PostListTile({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        dateFormat.format(post.date),
        style: TextStyle(fontSize: 22),
      ),
      trailing: Container(
        decoration: ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(13),
          child: Text(
            post.quantity.toString(),
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed('view', arguments: post);
      },
    );
  }
}