import 'package:desserts_app/providers/categories_provider.dart';
import 'package:desserts_app/providers/product_provider.dart';
import 'package:desserts_app/screens/detail_screen.dart';
import 'package:desserts_app/screens/home_screen.dart';
import 'package:desserts_app/widgets/category_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ListProduct(),
        ),
        ChangeNotifierProvider.value(
          value: CategoryList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Raleway'),
        home: HomePage(),
        routes: {
          DetailScreen.routeName: (context) => DetailScreen(),
          CategoryDetail.routeName: (context) => CategoryDetail(),
        },
      ),
    );
  }
}
