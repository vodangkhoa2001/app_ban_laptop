// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';

class ProductInfo {
  int id = 0;
  String name = "";
  String description = "";
  int price = 0;
  String img = "";

  ProductInfo(int id, String name, String description, String img, int price) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.img = img;
    this.price = price;
  }

  ProductInfo.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        price = json['price'],
        img = json['img'];
}
