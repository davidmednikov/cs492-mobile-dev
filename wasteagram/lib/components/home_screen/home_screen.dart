import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'post_list.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) => getTitleText(context, snapshot),
        ),
        centerTitle: true
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: PostList(),
        ),
      ),
      floatingActionButton: Semantics(
        button: true,
        enabled: true,
        onTapHint: 'Add Post',
        child: SpeedDial(
          marginRight: 175,
          child: Icon(Icons.add),
          children: [
            SpeedDialChild(
              child: Semantics(
                button: true,
                enabled: true,
                onTapHint: 'Take Picture',
                child: Icon(Icons.camera_alt),
              ),
              backgroundColor: Colors.red,
              label: 'Camera',
              labelStyle: TextStyle(fontSize: 18),
              onTap: () => getImageFromCamera(),
            ),
            SpeedDialChild(
              child: Semantics(
                button: true,
                enabled: true,
                onTapHint: 'Choose From Gallery',
                child: Icon(Icons.photo_album),
              ),
              backgroundColor: Colors.green,
              label: 'Gallery',
              labelStyle: TextStyle(fontSize: 18),
              onTap: () => getImageFromGallery(),
            ),
          ],
        ),
      )
    );
  }

  Widget getTitleText(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData && snapshot.data.documents.length > 0) {
      int totalCount = 0;
      snapshot.data.documents.forEach((post) {
        totalCount += post['quantity'];
      });
      return Text('Wasteagram - $totalCount');
    }
    return Text('Wasteagram - 0');
  }

  Future getImageFromCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    Navigator.of(context).pushNamed('add', arguments: image);
  }

  Future getImageFromGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    Navigator.of(context).pushNamed('add', arguments: image);
  }

}