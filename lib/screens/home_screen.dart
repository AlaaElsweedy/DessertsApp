import 'package:desserts_app/data.dart';
import 'package:desserts_app/providers/categories_provider.dart';
import 'package:desserts_app/providers/product_provider.dart';
import 'package:desserts_app/widgets/home_bottom_section_widget.dart';
import 'package:desserts_app/widgets/home_header_widget.dart';
import 'package:desserts_app/widgets/main_widget.dart';
import 'package:desserts_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ListProduct>(context).products;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ChangeNotifierProvider.value(
                  value: CategoryList(),
                  child: HomeHeaderWidget(),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 80, bottom: 120),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: products[index],
                        child: ProductWidget(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          HomeBottomSectionWidget(),
        ],
      ),
    );
  }
}
