import 'package:ban_laptop/models/product/product1.dart';
import 'package:ban_laptop/services/product_service.dart';
import 'package:flutter/widgets.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  bool loading = false;

  getProduct(context) async {
    loading = true;
    products = await getAllProduct(context);
    loading = false;
    notifyListeners();
  }
}
