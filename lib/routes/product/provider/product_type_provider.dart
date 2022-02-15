import 'package:ban_laptop/models/product/product_type.dart';
import 'package:ban_laptop/services/product_type_service.dart';
import 'package:flutter/widgets.dart';

class ProductTypeProvider extends ChangeNotifier {
  List<ProductType> productTypes = [];
  bool loading = false;
  getProductType(context) async {
    loading = true;
    productTypes = await getAllProductType(context);
    loading = false;
    notifyListeners();
  }
}
