import 'dart:convert';
import 'package:ban_laptop/base_url.dart';
import 'package:ban_laptop/models/account/account.dart';
import 'package:http/http.dart' as http;

String infoUrl = baseUrl + 'account/user01';

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
      avatar: imgUserUrl+data['HinhAnh'],
      phone: data['SDT'],
      address: data['DiaChi'],
      account_type: data['ID_LoaiTaiKhoan'],
      status: data['TrangThai_TaiKhoan'],
    );
  }
}
