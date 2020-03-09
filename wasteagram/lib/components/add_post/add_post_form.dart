import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:location/location.dart';
import 'selected_image.dart';

class AddPostForm extends StatefulWidget {
  File image;

  AddPostForm({Key key, this.image}) : super(key: key);

  @override
  _AddPostFormState createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {

  final formKey = GlobalKey<FormState>();

  LocationData locationData;

  int quantity;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: retrieveLocation(),
      builder: (BuildContext context, AsyncSnapshot<LocationData> snapshot) => createForm(context, snapshot),
    );
  }

  Widget createForm(BuildContext context, AsyncSnapshot<LocationData> snapshot) {
    if (snapshot.hasData) {
      locationData = snapshot.data;
      return ListView(
        children: [
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SelectedImage(image: widget.image),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                        child: TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: 'Number of Items',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
                          ],
                          onSaved: (value) {
                            quantity = int.parse(value);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter the number of items';
                            }
                            return null;
                          }
                        )
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: RaisedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              await uploadPost();
                              Navigator.of(context).pop();
                            }
                          },
                          color: Colors.lightBlue,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                            child: Center(
                              child: Icon(Icons.cloud_upload, size: 50, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }
    return Center(child: CircularProgressIndicator());
  }

  void uploadPost() async{
    StorageReference storageReference = FirebaseStorage.instance.ref().child(
      '${getFilename()} - ${new DateTime.now()}'
    );
    StorageUploadTask uploadTask = storageReference.putFile(widget.image);
    await uploadTask.onComplete;
    String url = await storageReference.getDownloadURL();
    Firestore.instance.collection('posts').add({
      'date': Timestamp.fromDate(new DateTime.now()),
      'imageURL': url,
      'latitude': locationData.latitude,
      'longitude': locationData.longitude,
      'quantity': quantity,
    });
  }

  String getFilename() {
    int lastSlashIndex = widget.image.path.lastIndexOf('/');
    return widget.image.path.substring(lastSlashIndex);
  }

  Future<LocationData> retrieveLocation() async {
    Location location = new Location();
    return await location.getLocation();
  }
}