import 'package:flutter/material.dart';
import 'package:shopping_cart/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: DashBoard(title: 'Place order'),
    );
  }
}