import 'package:desserts_app/custom_button.dart';
import 'package:desserts_app/data.dart';
import 'package:desserts_app/providers/cart_provider.dart';
import 'package:desserts_app/providers/orders_provider.dart';
import 'package:desserts_app/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      'Total:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Chip(
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: primaryColor,
                      label: Text(
                        '\$${cart.totalPrice.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) => CartItemWidget(
                id: cart.items.values.toList()[index].id,
                productId: cart.items.keys.toList()[index],
                title: cart.items.values.toList()[index].title,
                image: cart.items.values.toList()[index].image,
                price: cart.items.values.toList()[index].price,
                quantity: cart.items.values.toList()[index].quantity,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Color.fromRGBO(245, 245, 245, 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomButton(
                  height: 60,
                  width: double.infinity,
                  child: Text(
                    'Order now',
                    style: TextStyle(
                      color:
                          cart.totalPrice == 0.0 ? Colors.grey : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [primaryColor, secondaryColor],
                  ),
                  onPressed: cart.totalPrice == 0.0
                      ? null
                      : () {
                          Provider.of<Orders>(context, listen: false).addOrder(
                            cart.items.values.toList(),
                            cart.totalPrice,
                          );
                          cart.clear();
                        },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
