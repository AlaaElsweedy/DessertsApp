import 'package:desserts_app/data.dart';
import 'package:desserts_app/provider/product.dart';
import 'package:desserts_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Product>(context);
    return Stack(
      children: [
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.only(bottom: 50),
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(245, 245, 245, 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: Container(
              width: 155,
              child: Column(
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
                  SizedBox(height: 10),
                  Text(
                    '\$ ${item.price}',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Text(
                            '${item.quantity}',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                            ),
                          ),
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        //-------------- Image ---------------
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            DetailScreen.routeName,
            arguments: item.id,
          ),
          child: Container(
            color: Colors.transparent,
            height: 120,
            width: 140,
            child: Transform.translate(
              offset: Offset(25, -35),
              child: Image.asset(
                item.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        //------------------ End of Image ---------------
      ],
    );
  }

  Widget buildRaisedButton({Function onPressed, Icon icon}) {
    return SizedBox(
      height: 40,
      width: 40,
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
