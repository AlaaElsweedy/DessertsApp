import 'package:flutter/foundation.dart';
import 'package:desserts_app/models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Chocolate Cake',
      ingredients: ' flour, sugar, eggs, butter or oil or margarine, a liquid, and a leavening agent, such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied, or fresh fruit, nuts, cocoa, and extracts such as vanilla, with numerous substitutions for the primary ingredients',
      image: 'assets/images/chocolate_cake.png',
      price: 13.99,
      quantity: 0,
    ),
    Product(
      title: 'Sweet Holiday',
      id: 'p2',
      ingredients: ' flour, sugar, eggs, butter or oil or margarine, a liquid, and a leavening agent, such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied, or fresh fruit, nuts, cocoa, and extracts such as vanilla, with numerous substitutions for the primary ingredients',
      image: 'assets/images/sweet_holiday.png',
      price: 18.50,
      quantity: 0,
    ),
    Product(
      id: 'p3',
      title: 'Strawberry Pie',
      ingredients: ' flour, sugar, eggs, butter or oil or margarine, a liquid, and a leavening agent, such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied, or fresh fruit, nuts, cocoa, and extracts such as vanilla, with numerous substitutions for the primary ingredients',
      image: 'assets/images/strawberry-pie.png',
      price: 21.99,
      quantity: 0,
    ),
    Product(
      id: 'p4',
      title: 'Oreo Cake',
      ingredients: ' flour, sugar, eggs, butter or oil or margarine, a liquid, and a leavening agent, such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied, or fresh fruit, nuts, cocoa, and extracts such as vanilla, with numerous substitutions for the primary ingredients',
      image: 'assets/images/oreo_cake.png',
      price: 20.50,
      quantity: 0,
    ),
  ];

  List<Product> get products => _products;
}



