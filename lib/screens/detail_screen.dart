import 'package:desserts_app/data.dart';
import 'package:desserts_app/provider/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  static final String routeName = '/detail-screen';

  @override
  Widget build(BuildContext context) {
    final headerHeight = MediaQuery.of(context).size.height * 0.6;
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product =
        Provider.of<ListProduct>(context, listen: false).findById(productId);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: headerHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [secondaryColor, Colors.red[200]],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: BackButton(
                        color: secondaryColor,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        product.image,
                        height: headerHeight * 0.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            height: headerHeight * 0.8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: secondaryColor, width: 2),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite_border_sharp,
                                color: secondaryColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Product Ingredients',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      product.ingredients,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
