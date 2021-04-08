import 'package:desserts_app/data.dart';
import 'package:desserts_app/widgets/favourits_widget.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListTile(
          leading: Icon(
            Icons.favorite_sharp,
            color: primaryColor,
            size: 35,
          ),
          title: Text(
            'Favorites',
            style: TextStyle(color: primaryColor, fontSize: 25),
          ),
          onTap: () {
            Navigator.of(context).popAndPushNamed(FavouritesWidget.routeName);
          },
        ),
      ),
    );
  }
}
