import 'dart:convert';
import 'package:ban_laptop/base_url.dart';
import 'package:ban_laptop/models/account/account.dart';
import 'package:ban_laptop/models/invoice/invoice.dart';
import 'package:ban_laptop/models/product/product.dart';
import 'package:ban_laptop/models/product/product_type.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

final storage = new FlutterSecureStorage();

String infoUrl = baseUrl + 'account/';
String urlProduct = baseUrl + 'products/';
String urlProductType = baseUrl + 'category';
String urlProductByType = baseUrl + 'products/type/';
String urlUser = baseUrl + 'account/login';
String urlInvoiceByUser = baseUrl + 'invoice/';
String urlChangePass = baseUrl + 'account/password';

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

  static Future<UserAccount> getUserInfo(id) async {
    final response = await http.get(Uri.parse(infoUrl + id), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    final responseData = jsonDecode(response.body);
    final data = responseData['data'];
    return UserAccount(
      id: data['id'],
      username: data['TenDangNhap'],
      email: data['Email'],
      fullName: data['HoTen'],
      avatar: imgUserUrl + data['HinhAnh'],
      phone: data['SDT'],
      address: data['DiaChi'],
      account_type: data['ID_LoaiTaiKhoan'],
      status: data['TrangThai_TaiKhoan'],
    );
  }

  static Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse(urlProduct+'all'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    final responseData = jsonDecode(response.body);
    final data = responseData['data'] as List;
    List<Product> lstproduct = data.map((e) {
      return Product(
          id: e['id'],
          maDongSanPham: e['MaDongSanPham'],
          tenSanPham: e['TenSanPham'],
          giaNhap: e['GiaNhap'],
          giaBan: e['GiaBan'],
          soLuong: e['SoLuong'],
          maNhaSanXuat: e['MaNhaSanXuat'],
          hinhAnh:imgProductUrl+ e['HinhAnh'],
          moTa: e['MoTa'],
          tenMau: e['TenMau'],
          tenOCung: e['TenOCung'],
          tenRam: e['TenRam'],
          tenManHinh: e['TenManHinh'],
          tenCPU: e['TenCPU']);
    }).toList();
    return lstproduct;
  }

  static Future<Product> getProductDetail(String id) async {
    final response = await http.get(Uri.parse(urlProduct+id), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    final responseData = jsonDecode(response.body);
    final data = responseData['data'];
      return Product(
          id: data['id'],
          maDongSanPham: data['MaDongSanPham'],
          tenSanPham: data['TenSanPham'],
          giaNhap: data['GiaNhap'],
          giaBan: data['GiaBan'],
          soLuong: data['SoLuong'],
          maNhaSanXuat: data['MaNhaSanXuat'],
          hinhAnh:imgProductUrl+ data['HinhAnh'],
          moTa: data['MoTa'],
          tenMau: data['TenMau'],
          tenOCung: data['TenOCung'],
          tenRam: data['TenRam'],
          tenManHinh: data['TenManHinh'],
          tenCPU: data['TenCPU']);    
  }

  static Future<List<Product>> getAllProductByType(int id) async {
    final response = await http.get(Uri.parse(urlProductByType + '$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        });
    final responseData = jsonDecode(response.body);
    final data = responseData['data'] as List;
    List<Product> lstproduct = data.map((e) {
      return Product(
          id: e['id'],
          maDongSanPham: e['MaDongSanPham'],
          tenSanPham: e['TenSanPham'],
          giaNhap: e['GiaNhap'],
          giaBan: e['GiaBan'],
          soLuong: e['SoLuong'],
          maNhaSanXuat: e['MaNhaSanXuat'],
          hinhAnh:imgProductUrl+ e['HinhAnh'],
          moTa: e['MoTa'],
          tenMau: e['TenMau'],
          tenOCung: e['TenOCung'],
          tenRam: e['TenRam'],
          tenManHinh: e['TenManHinh'],
          tenCPU: e['TenCPU']);
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

//login
  static Future<List<String>> login(String email, String password) async {
    var response = await http.post(Uri.parse(urlUser),
        body: jsonEncode({"Email": email, "Password": password}),
        headers: {"Content-Type": "application/json"});
    Map<String, dynamic> responseData = jsonDecode(response.body);
    List<String> lst = [];
    lst.add(responseData["mess"]);
    lst.add(responseData["0"]);
    return lst;
  }

  //get invoice
  static Future<List<Invoice>> getAllInvoiceByUser(id) async {
    final response = await http.get(Uri.parse(urlInvoiceByUser + id), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    final responseData = jsonDecode(response.body);
    final data = responseData['data'] as List;
    List<Invoice> lstInvoice = data.map((e) {
      return Invoice(
          id: e['id'],
          maTaiKhoan: e['MaTaiKhoan'],
          diaChiGiaoHang: e['DiaChiGiaoHang'],
          sDTGiaoHang: e['SDT_GiaoHang'],
          tongTien: e['TongTien'],
          trangThoaiHoaDon: e['TrangThoai_HoaDon'],
          hinhAnh: imgProductUrl + e['HinhAnh'],
          tenSanPham: e['TenSanPham'],
          hoTen: e['HoTen'],
          soLuong: e['SoLuong'],
          donGia: e['GiaNhap'],
          createdAt: e['created_at']);
    }).toList();
    return lstInvoice;
  }

  //doi mat khau
  static Future<http.Response> changePassword(
    String email,
    String oldPassword,
    String newPassword,
  ) async {
    final response = await http.post(Uri.parse(urlChangePass),
        body: jsonEncode({
          "Email": email,
          "OldPassword": oldPassword,
          "NewPassword": newPassword,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    return response;
  }
}
