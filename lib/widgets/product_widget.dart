import 'package:desserts_app/data.dart';
import 'package:desserts_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
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
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: Container(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
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
                            icon: Icon(Icons.remove, color: Colors.white,),
                            onPressed: () {
                              setState(() {
                                if(item.quantity <= 0){
                                  item.quantity = 0;
                                } else {
                                  setState(() {
                                    item.quantity --;
                                  });
                                }
                              });
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
                            icon: Icon(Icons.add, color: Colors.white,),
                            onPressed: () {
                              setState(() {
                                item.quantity ++;
                              });
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
        Container(
          height: 120,
          width: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400.withOpacity(0.6),
                  offset: Offset(30, 1),
                  spreadRadius: -25,
                  blurRadius: 5,
                ),
              ]),
          child: Transform.translate(
            offset: Offset(25, -35),
            child: Image.asset(
              item.image,
              fit: BoxFit.contain,
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
