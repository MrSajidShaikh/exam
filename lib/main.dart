import 'package:exam/CartScreen.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'package:exam/DetailPage.dart';

void main()
{
  runApp(const GroceryStore());
}

class GroceryStore extends StatelessWidget {
  const GroceryStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => const HomeScreen(),
        '/detail' : (context)=> const Detail_Page(),
        '/cart' : (context)=> const CartScreen(),
      },
    );
  }
}
