import 'package:desserts_app/providers/cart_provider.dart';
import 'package:flutter/foundation.dart';

class OrderItem {
  final String id;
  final double total;
  final List<CartItem> cartItem;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.total,
    @required this.cartItem,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders => [..._orders];

  void addOrder(List<CartItem> products, double amount) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        cartItem: products,
        dateTime: DateTime.now(),
        total: amount,
      ),
    );
  }
}
