import 'package:ban_laptop/models/product/product.dart';
import 'package:ban_laptop/base_url.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<List<Product>> getAllProduct(context) async {
  List<Product> products = [];

  try {
    final response = await http.get(
      Uri.parse(baseUrl + 'products/all'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      products = (item as List).map((pt) => Product.fromJson(pt)).toList();
    } else {
      print('Lỗi API');
    }
  } catch (e) {
    rethrow;
  }
  return products;
}

Future<List<Product>> getAllNewProduct(context) async {
  List<Product> products = [];

  try {
    final response = await http.get(
      Uri.parse(newProductUrl),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      products = (item as List).map((pt) => Product.fromJson(pt)).toList();
    }
  } catch (e) {
    rethrow;
  }
  return products;
}
