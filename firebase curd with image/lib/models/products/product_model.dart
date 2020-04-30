import 'package:flutter/foundation.dart';
class Product {
  String productId;
  String title;
  String description;
  String image;
  double price;

  Product({
    this.productId,
    @required this.title,
    @required this.description,
    this.image,
    @required this.price,
  });

  //getter of product id
  String get pId => productId;

  //convert product object into map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (pId != null) {
      map['productId'] = productId;
    }
    map['title'] = title;
    map['description'] = description;
    map['image'] = image;
    map['price'] = price;
    return map;
  }

  //extract product object frm map
  Product.fromMapObject(Map<String, dynamic> snapshot, String id) {
    this.productId = id;
    this.title = snapshot['title'];
    this.description = snapshot['description'];
    this.image = snapshot['image'];
    this.price = snapshot['price'];
  }
}
