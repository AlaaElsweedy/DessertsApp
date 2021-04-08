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
      ),
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) {
          return Center(
            child: Text(product[index].title.toString()),
          );
        },
      ),
    );
  }
}
