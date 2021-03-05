import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String ingredients;
  final String image;
  final double price;
  int quantity;

  Product({
    this.id,
    this.title,
    this.ingredients,
    this.image,
    this.price,
    this.quantity = 0,
  });
}
