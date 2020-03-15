// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wasteagram/components/models/post_model.dart';

void main() {
  test('Post created using default constructor should have appropriate property values', () {
    String id = 'random_characters_not_random';
    DateTime date = new DateTime.now();
    String url = '404';
    int quantity = 1;
    double latitude = 2.0;
    double longitude = -1.0;

    PostModel post = PostModel(id: id, date: date, imageURL: url, quantity: quantity, latitude: latitude, longitude: longitude);

    expect(post.id, id);
    expect(post.date, date);
    expect(post.imageURL, url);
    expect(post.quantity, quantity);
    expect(post.latitude, latitude);
    expect(post.longitude, longitude);
  });

  test('Post created from Map should have appropriate property values', () {
    DateTime date = new DateTime.now();
    String url = '404';
    int quantity = 1;
    double latitude = 2.0;
    double longitude = -1.0;

    PostModel post = PostModel.fromMap({
      'date' : date,
      'imageURL' : url,
      'quantity' : quantity,
      'latitude' : latitude,
      'longitude' : longitude,
    });

    expect(post.date, date);
    expect(post.imageURL, url);
    expect(post.quantity, quantity);
    expect(post.latitude, latitude);
    expect(post.longitude, longitude);
  });

  test('Post created from Map with ID have appropriate property values', () {
    String id = 'random_characters_not_random';
    DateTime date = new DateTime.now();
    String url = '404';
    int quantity = 1;
    double latitude = 2.0;
    double longitude = -1.0;

    PostModel post = PostModel.fromMap({
      'id' : id,
      'date' : date,
      'imageURL' : url,
      'quantity' : quantity,
      'latitude' : latitude,
      'longitude' : longitude,
    });

    expect(post.id, id);
    expect(post.date, date);
    expect(post.imageURL, url);
    expect(post.quantity, quantity);
    expect(post.latitude, latitude);
    expect(post.longitude, longitude);
  });
}
