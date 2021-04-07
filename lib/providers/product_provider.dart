import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String ingredients;
  final String image;
  final double price;
  int quantity;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.ingredients,
    @required this.image,
    @required this.price,
    this.quantity = 0,
    this.isFavorite = false,
  });

  incrementQuantity() {
    quantity++;
    notifyListeners();
  }

  decrementQuantity() {
    if (quantity <= 0) {
      quantity = 0;
    } else {
      quantity--;
    }
    notifyListeners();
  }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class ListProduct with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Chocolate Cake',
      ingredients:
          'Flour, Sugar, Eggs, Butter or Oil or Margarine, A liquid and a leavening agent such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied or fresh fruit, nuts, cocoa and extracts such as vanilla with numerous substitutions for the primary ingredients',
      image: 'assets/images/chocolate_cake.png',
      price: 13.99,
    ),
    Product(
      id: 'p2',
      title: 'Sweet Holiday',
      ingredients:
          'Flour, Sugar, Eggs, Butter or Oil or Margarine, A liquid and a leavening agent such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied or fresh fruit, nuts, cocoa and extracts such as vanilla with numerous substitutions for the primary ingredients',
      image: 'assets/images/sweet_holiday.png',
      price: 18.50,
    ),
    Product(
      id: 'p3',
      title: 'Strawberry Pie',
      ingredients:
          'Flour, Sugar, Eggs, Butter or Oil or Margarine, A liquid and a leavening agent such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied or fresh fruit, nuts, cocoa and extracts such as vanilla with numerous substitutions for the primary ingredients',
      image: 'assets/images/strawberry-pie.png',
      price: 21.99,
    ),
    Product(
      id: 'p4',
      title: 'Oreo Cake',
      ingredients:
          'Flour, Sugar, Eggs, Butter or Oil or Margarine, A liquid and a leavening agent such as baking soda or baking powder. Common additional ingredients and flavourings include dried, candied or fresh fruit, nuts, cocoa and extracts such as vanilla with numerous substitutions for the primary ingredients',
      image: 'assets/images/oreo_cake.png',
      price: 20.50,
    ),
  ];

  List<Product> get products => [..._products];

  Product findById(String id) {
    return _products.firstWhere((element) => element.id == id);
  }
}
