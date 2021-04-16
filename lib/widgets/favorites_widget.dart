import 'package:desserts_app/data.dart';
import 'package:desserts_app/providers/cart_provider.dart';
import 'package:desserts_app/providers/product_provider.dart';
import 'package:desserts_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesWidget extends StatelessWidget {
  static final String routeName = '/favorites-widget';

  @override
  Widget build(BuildContext context) {
    final favoriteProduct = Provider.of<ListProduct>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('WishList'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: ListView.builder(
          itemCount: favoriteProduct.showFavoritesOnly.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Image.asset(
                    favoriteProduct.showFavoritesOnly[index].image,
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                title: Text(
                  favoriteProduct.showFavoritesOnly[index].title.toString(),
                ),
                trailing: ElevatedButton(
                  child: Text('Add to cart'),
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () {
                    Provider.of<Cart>(context, listen: false).addItem(
                      favoriteProduct.showFavoritesOnly[index].id,
                      favoriteProduct.showFavoritesOnly[index].title,
                      favoriteProduct.showFavoritesOnly[index].image,
                      favoriteProduct.showFavoritesOnly[index].price,
                      favoriteProduct.showFavoritesOnly[index].quantity = 1,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
