import 'package:desserts_app/custom_button.dart';
import 'package:desserts_app/data.dart';
import 'package:flutter/material.dart';

class HomeBottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bottomSectionHeight = 100.0;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      height: bottomSectionHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              height: 60,
              width: double.infinity,
              child: Text(
                'Selected 2 Items',
                style: TextStyle(color: Colors.white),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [secondaryColor, Colors.red[200]],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
