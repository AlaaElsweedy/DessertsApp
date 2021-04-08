import 'package:desserts_app/data.dart';
import 'package:desserts_app/providers/categories_provider.dart';
import 'package:desserts_app/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetail extends StatelessWidget {
  static final String routeName = '/category-detail';

  @override
  Widget build(BuildContext context) {
    final routeId = ModalRoute.of(context).settings.arguments as String;
    final category =
        Provider.of<CategoryList>(context, listen: false).findById(routeId);
    final product = ListProduct()
        .products
        .where((product) => product.categoryIds.contains(category.id))
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('WishList'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Image.asset(
                    product[index].image,
                    fit: BoxFit.fill,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                title: Text(
                  product[index].title.toString(),
                ),
                trailing: ElevatedButton(
                  child: Text('Add to cart'),
                  style: ElevatedButton.styleFrom(primary: primaryColor),
                  onPressed: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
