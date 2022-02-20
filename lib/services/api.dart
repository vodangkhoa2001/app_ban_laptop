import 'dart:convert';
import 'package:ban_laptop/base_url.dart';
import 'package:ban_laptop/models/account/account.dart';
import 'package:ban_laptop/models/product/product.dart';
import 'package:ban_laptop/models/product/product_type.dart';
import 'package:http/http.dart' as http;

String infoUrl = baseUrl + 'account/user01';
String urlProduct = baseUrl + 'products/all';
String urlProductType = baseUrl + 'category';
String urlProductByType = baseUrl + 'products/type/';
class CallApi {
  postData(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() =>
      {'Content-type': 'aplication/json', 'Accept': 'application/json'};

  static Future<UserAccount> getUserInfo() async {
    final response = await http.get(Uri.parse(infoUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    final responseData = jsonDecode(response.body);
    final data = responseData['data'];
    return UserAccount(
      id: data['id'],
      username: data['TenDangNhap'],
      email: data['Email'],
      password: data['MatKhau'],
      fullName: data['HoTen'],
      avatar: imgUserUrl + data['HinhAnh'],
      phone: data['SDT'],
      address: data['DiaChi'],
      account_type: data['ID_LoaiTaiKhoan'],
      status: data['TrangThai_TaiKhoan'],
    );
  }

  static Future<List<Product>> getAllProfucts() async {
    final response = await http.get(Uri.parse(urlProduct), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    final responseData = jsonDecode(response.body);
    final data = responseData['data'] as List;
    List<Product> lstproduct = data.map((e) {
      return Product(
          id: e['id'],
          TenSanPham: e['TenSanPham'],
          GiaBan: e['GiaBan'],
          GiaNhap: e['GiaNhap'],
          SoLuong: e['SoLuong'],
          MaNhaSanXuat: e['MaNhaSanXuat'],
          MaDongSanPham: e['MaDongSanPham'],
          HinhAnh: imgUserUrl + e['HinhAnh'],
          MoTa: e['MoTa']);
    }).toList();
    return lstproduct;
  }


 static Future<List<Product>> getAllProfuctByType(int id) async {
    final response = await http.get(Uri.parse(urlProductByType + '$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    final responseData = jsonDecode(response.body);
    final data = responseData['data'] as List;
    List<Product> lstproduct = data.map((e) {
      return Product(
          id: e['id'],
          TenSanPham: e['TenSanPham'],
          GiaBan: e['GiaBan'],
          GiaNhap: e['GiaNhap'],
          SoLuong: e['SoLuong'],
          MaNhaSanXuat: e['MaNhaSanXuat'],
          MaDongSanPham: e['MaDongSanPham'],
          HinhAnh: imgProductUrl + e['HinhAnh'],
          MoTa: e['MoTa']);
    }).toList();
    return lstproduct;
  }

  
  static Future<List<ProductType>> getAllProfuctType() async {
    final response = await http.get(Uri.parse(urlProductType), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    final responseData = jsonDecode(response.body);
    final data = responseData['data'] as List;
    List<ProductType> lstProductType = data.map((e) {
      return ProductType(
          id: e['id'],
          tenDongSanPham: e['TenDongSanPham'],
          trangThaiDongSanPham: e['TrangThai_DongSanPham']);
    }).toList();
    return lstProductType;
  }
}
