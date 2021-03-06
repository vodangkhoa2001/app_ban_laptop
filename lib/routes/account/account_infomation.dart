// ignore_for_file: prefer_const_constructors

import 'package:ban_laptop/main.dart';
import 'package:ban_laptop/models/account/account.dart';
import 'package:ban_laptop/routes/product/provider/account_provider.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';
import 'edit_account.dart';

// import 'package:ban_laptop/models/account/account.dart';
final storage = new FlutterSecureStorage();

class AccountInfo extends StatefulWidget {
  UserAccount account;
  AccountInfo({Key? key, required this.account}) : super(key: key);

  @override
  _AccountInfoState createState() => _AccountInfoState(account);
}

class _AccountInfoState extends State<AccountInfo> {
  final UserAccount account;
  _AccountInfoState(this.account);
  TextEditingController txtAddress = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin tài khoản'),
          actions: [
            // ignore: deprecated_member_use
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: EditAccount(
                            account: account,
                          )));
                },
                child: const Text(
                  'Sửa',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                              child: CircleAvatar(
                            radius: 40.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                child: const Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 12.0,
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 15.0,
                                      color: Color(0xFF404040),
                                    ),
                                  ),
                                ),
                                radius: 45.0,
                                backgroundImage: NetworkImage(account.avatar)),
                          ))
                        ])),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          'Họ và tên',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        trailing: Text(account.fullName,
                            style: TextStyle(fontSize: 17)),
                      ),
                      ListTile(
                        title: Text(
                          'Số điện thoại',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        trailing:
                            Text(account.phone, style: TextStyle(fontSize: 17)),
                      ),
                      ListTile(
                        title: Text(
                          'Email',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        trailing:
                            Text(account.email, style: TextStyle(fontSize: 17)),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text(
                          'Địa chỉ giao hàng',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                      ),
                      ListTile(
                        title: Text(account.address,
                            style: TextStyle(fontSize: 15)),
                      ),
                      ButtonBar(
                        children: [
                          // ignore: deprecated_member_use
                          FlatButton(
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      // title: const Text('Địa chỉ mới của bạn!'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Container(
                                              width: 300,
                                              child: TextField(
                                                controller: txtAddress,
                                                decoration: InputDecoration(
                                                  hintText: 'Địa chỉ của bạn..',
                                                  suffixIcon: InkWell(
                                                    onTap: () async {
                                                      String? id = await storage
                                                          .read(key: "id");
                                                      String data =
                                                          await CallApi
                                                              .changeAddress(
                                                                  id!,
                                                                  txtAddress
                                                                      .text);
                                                      if (data ==
                                                          "thanh cong") {
                                                        Navigator
                                                            .pushAndRemoveUntil(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            HomePage(
                                                                              tab: 3,
                                                                            )),
                                                                (route) =>
                                                                    false);
                                                      }
                                                    },
                                                    child: Icon(
                                                        Icons.done_rounded),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Đóng'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: const Text('Sửa',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline))),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
