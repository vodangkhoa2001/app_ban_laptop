import 'package:flutter/material.dart';

class ProductDemo {
  late final String name;
  late final List<String> images;
  late final List<Color> colors;
  late final double prices, rate;

  ProductDemo({
    required this.images,
    required this.colors,
    required this.name,
    required this.prices,
    required this.rate,
  });
}

List<ProductDemo> demoProducts = [
  ProductDemo(
    images: [
      "assets/images/products/macOs.jpg",
      "assets/images/products/asus.jpg",
    ],
    colors: [
      Colors.white,
    ],
    name: "MacBook Pro 14 M1 Max 2021/32-core ",
    prices: 59000000,
    rate: 2.0,
  ),
  ProductDemo(
    images: [
      "assets/images/products/asus.jpg",
      "assets/images/products/macOs.jpg",
    ],
    colors: [
      Colors.white,
    ],
    name: "Asus ROG Strix Gaming G15 G513IH R7 4800H",
    prices: 60000000,
    rate: 5.0,
  ),
  ProductDemo(
    images: [
      "assets/images/products/macOs.jpg",
    ],
    colors: [
      Colors.white,
    ],
    name: "MacBook Pro 14 M1 Max 2021/32-core ",
    prices: 4000000,
    rate: 8.0,
  ),
];
