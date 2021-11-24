//import 'dart:async';

import 'package:flutter/material.dart';
import 'routes/home_page.dart';
import 'routes/product_category.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      routes:{
        '/': (context)=>const LoadingScreen(),
        '/product_portfolio': (context)=> const ProductCategory()
      }

    );
  }
}
