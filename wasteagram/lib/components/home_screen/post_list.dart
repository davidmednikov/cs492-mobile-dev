import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post_model.dart';
import 'post_list_tile.dart';

class PostList extends StatefulWidget {
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: Firestore.instance.collection('posts').orderBy('date', descending: true).snapshots(),
              builder: (context, snapshot) => convertEntriesToListTiles(context, snapshot),
            ),
          ),
        ]
      )
    );
  }

  Widget convertEntriesToListTiles(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData && snapshot.data.documents.length > 0) {
      return ListView.builder(
        itemCount:snapshot.data.documents.length,
        itemBuilder: (context, index) {
          var postData = snapshot.data.documents[index];
          PostModel post = createPostFromMap(postData);
          return PostListTile(post: post);
        }
      );
    }
    return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey)));
  }

  PostModel createPostFromMap(DocumentSnapshot post) {
    return PostModel(
      id: post['id'],
      date: post['date'].toDate(),
      imageURL: post['imageURL'],
      quantity: post['quantity'],
      latitude: post['latitude'],
      longitude: post['longitude'],
    );
  }
}