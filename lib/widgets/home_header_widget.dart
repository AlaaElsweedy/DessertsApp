import 'package:desserts_app/data.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatefulWidget {
  @override
  _HomeHeaderWidgetState createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  int currentIndex = 0;
  final List<String> categories = [
    'Fruit',
    'With milk',
    'With nuts',
    'Chocolate',
    'Biscuit ',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Desserts',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => buildCategory(index),
          ),
        ),
      ],
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        width: 80,
        decoration: BoxDecoration(
          color: currentIndex == index ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: primaryColor),
        ),
        child: Text(
          categories[index],
          style: TextStyle(
            color: currentIndex == index ? Colors.white : primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
