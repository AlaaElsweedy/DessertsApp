import 'package:desserts_app/data.dart';
import 'package:desserts_app/providers/orders_provider.dart';
import 'package:desserts_app/widgets/main_drawer.dart';
import 'package:desserts_app/widgets/order_item__widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '/order-Screen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
        backgroundColor: primaryColor,
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) => OrderWidget(
          orderData.orders[index],
        ),
      ),
    );
  }
}
