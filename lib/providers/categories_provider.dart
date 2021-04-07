import 'package:flutter/foundation.dart';

class Categories {
  final String id;
  final String title;

  Categories({this.id, this.title});
}

class CategoryList with ChangeNotifier {
  List<Categories> _categories = [
    Categories(id: 'fruit', title: 'Fruit'),
    Categories(id: 'with milk', title: 'With milk'),
    Categories(id: 'with nuts', title: 'With nuts'),
    Categories(id: 'chocolate', title: 'Chocolate'),
    Categories(id: 'biscuit', title: 'Biscuit'),
  ];

  List<Categories> get categories => _categories;

  Categories findById(String id) {
    return _categories.firstWhere((element) => element.id == id);
  }
}
