import 'package:desserts_app/widgets/home_bottom_section_widget.dart';
import 'package:desserts_app/widgets/home_header_widget.dart';
import 'package:desserts_app/widgets/product_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:desserts_app/provider/product_provider.dart';
import 'package:desserts_app/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context).products;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: primaryColor,
          ),
          onPressed: () {},
        ),
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
                SizedBox(height: 20),
                HomeHeaderWidget(),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 80, bottom: 120),
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
