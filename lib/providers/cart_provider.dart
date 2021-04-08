import 'package:desserts_app/providers/product_provider.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final Product product;
  CartItem({
    @required this.id,
    @required this.product,
  });
}

class Cart with ChangeNotifier {}
