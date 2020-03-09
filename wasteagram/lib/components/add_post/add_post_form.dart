import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'selected_image.dart';

class AddPostForm extends StatefulWidget {
  File image;

  AddPostForm({Key key, this.image}) : super(key: key);

  @override
  _AddPostFormState createState() => _AddPostFormState();
}

class _AddPostFormState extends State<AddPostForm> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SelectedImage(image: widget.image),
              // SizedBox(height: 10),
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
                          print(value);
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
              // SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                        child: RaisedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              formKey.currentState.save();
                              print(formKey.currentState);
                              // Navigator.of(context).pop();
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}