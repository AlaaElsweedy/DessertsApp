import 'package:desserts_app/data.dart';
import 'package:desserts_app/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeaderWidget extends StatefulWidget {
  @override
  _HomeHeaderWidgetState createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends State<HomeHeaderWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryList>(context).categories;
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
            itemBuilder: (context, index) => buildCategory(
              index,
              categories[index].title,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCategory(int index, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        width: 80,
        decoration: BoxDecoration(
          color: currentIndex == index ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: primaryColor),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: currentIndex == index ? Colors.white : primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
