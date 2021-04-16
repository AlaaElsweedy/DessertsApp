import 'package:desserts_app/data.dart';
import 'package:desserts_app/screens/order_screen.dart';
import 'package:desserts_app/widgets/favorites_widget.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ListTile(
                leading: Icon(
                  Icons.shop,
                  color: primaryColor,
                  size: 30,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: primaryColor, fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.favorite_sharp,
                color: primaryColor,
                size: 30,
              ),
              title: Text(
                'Favorites',
                style: TextStyle(color: primaryColor, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FavouritesWidget.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.payment,
                color: primaryColor,
                size: 30,
              ),
              title: Text(
                'Orders',
                style: TextStyle(color: primaryColor, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrderScreen.routeName);
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
