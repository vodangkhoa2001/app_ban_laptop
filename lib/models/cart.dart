import 'package:ban_laptop/models/product/product.dart';

class Cart {
  int soLuong;
  Product sanPham;

  Cart({required this.sanPham,required this.soLuong});

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['maSanPham'] = this.sanPham;
  //   data['soLuong'] = this.soLuong;
  //   return data;
  // }
}
