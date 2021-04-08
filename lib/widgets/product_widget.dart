import 'package:desserts_app/data.dart';
import 'package:desserts_app/providers/product_provider.dart';
import 'package:desserts_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Product>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      padding: EdgeInsets.only(right: 22),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 245, 245, 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                color: Colors.transparent,
                height: 120,
                width: 140,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                    DetailScreen.routeName,
                    arguments: item.id,
                  ),
                  child: Transform.translate(
                    offset: Offset(25, -35),
                    child: Hero(
                      tag: item.title,
                      child: Image.asset(
                        item.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Transform.translate(
                  offset: Offset(-25, 0),
                  child: IconButton(
                    icon: Icon(
                      item.isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 35,
                    ),
                    onPressed: () {
                      item.toggleFavoriteStatus();
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  softWrap: true,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$ ${item.price}',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    buildRaisedButton(
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        item.decrementQuantity();
                      },
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${item.quantity}',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    buildRaisedButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        item.incrementQuantity();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRaisedButton({Function onPressed, Icon icon}) {
    return SizedBox(
      height: 40,
      width: 40,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: primaryColor,
        padding: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: icon,
        onPressed: onPressed,
      ),
    );
  }
}
