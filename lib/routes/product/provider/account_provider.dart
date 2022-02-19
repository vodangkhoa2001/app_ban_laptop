import 'package:ban_laptop/models/account/account.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class AccountProvider {
  static Future<dynamic> readJsonData() async {
    //Đọc dữ liệu từ file assets
    var jsonText = await rootBundle.loadString('data/accountdata.json');
    //Chuyển text json sang dữ liệu
    var data = json.decode(jsonText);
    return data["account"];
  }

  //Hàm lấy tất cả danh sách Accounts
  static Future<UserAccount> getAccount() async {
    // UserAccount lstResult;
    dynamic data = await readJsonData();
    //Chuyển data sang danh sách UserAccount
    // lstResult = data.map((e) => UserAccount.fromJson(e));
    return UserAccount(id: data['id'], fullName: data['fullName'], password: data['password'], username: data['username'], avatar: data['avatar'], phone: data['phone'], email: data['email'], address: data['address'],account_type: data['account_type'],status: data['status']);
  }
}
