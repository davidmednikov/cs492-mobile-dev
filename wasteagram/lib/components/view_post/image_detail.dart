import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
            child: CachedNetworkImage(
              imageUrl: imageURL,
              placeholder: (context, url) => Padding(
                padding: EdgeInsets.all(100),
                child: Center(
                  child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}