import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final String image;
  final double price;
  final int quantity;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  void addItem(String productId, String title, String image, double price,
      int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          image: existingItem.image,
          price: existingItem.price,
          quantity: existingItem.quantity + quantity,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          image: image,
          price: price,
          quantity: quantity,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  double get totalPrice {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  int get itemCount {
    var count = 0;
    _items.forEach((key, value) {
      count += value.quantity;
    });
    return count;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
