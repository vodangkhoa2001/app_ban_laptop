// ignore_for_file: prefer_const_constructors

import 'package:ban_laptop/models/account/account.dart';
import 'package:ban_laptop/routes/product/provider/account_provider.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'edit_account.dart';

class AccountInfo extends StatefulWidget {
  UserAccount account;
  AccountInfo({Key? key, required this.account}) : super(key: key);

  @override
  _AccountInfoState createState() => _AccountInfoState(account);
}

class _AccountInfoState extends State<AccountInfo> {
  final UserAccount account;
  _AccountInfoState(this.account);

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
                          child: EditAccount(account: account,)));
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
                            style: TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        title: Text(
                          'Số điện thoại',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        trailing: Text(account.phone,
                            style: TextStyle(fontSize: 20)),
                      ),
                      // ListTile(
                      //   title: Text(
                      //     'Giới tính',
                      //     style: TextStyle(color: Colors.black54, fontSize: 18),
                      //   ),
                      //   trailing: Text('Nam', style: TextStyle(fontSize: 20)),
                      // ),
                      ListTile(
                        title: Text(
                          'Email',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        trailing: Text(account.email,
                            style: TextStyle(fontSize: 20)),
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
                              onPressed: () {},
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
