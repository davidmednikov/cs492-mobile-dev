class PostModel {

  String id;
  DateTime date;
  String imageURL;
  int quantity;
  double latitude;
  double longitude;

  PostModel({ this.id, this.date, this.imageURL, this.quantity, this.latitude, this.longitude });

  PostModel.fromMap(Map map) {
    if (map['id'] != null) {
      this.id = map['id'];
    }
    this.date = map['date'];
    this.imageURL = map['imageURL'];
    this.quantity = map['quantity'];
    this.latitude = map['latitude'];
    this.longitude = map['longitude'];
  }
}