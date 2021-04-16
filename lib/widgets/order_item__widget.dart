import 'package:desserts_app/providers/orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderWidget extends StatelessWidget {
  final OrderItem orderItem;

  OrderWidget(this.orderItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          '\$${orderItem.total.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat('dd mm yyyy hh:mm').format(orderItem.dateTime),
        ),
      ),
    );
  }
}
