// ignore_for_file: prefer_const_constructors

import 'package:ban_laptop/models/account/account.dart';
import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  EditAccount({Key? key, required this.account}) : super(key: key);
  UserAccount account;
  @override
  _EditAccountState createState() => _EditAccountState(account);
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      txtName.text = account.fullName;
      txtPhone.text = account.phone;
      txtEmail.text = account.email;
    });
  } 
  UserAccount account;
  _EditAccountState(this.account);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cập nhật thông tin'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              autofocus: true,
              controller: txtName,
              decoration: InputDecoration(
                label: Text('Họ và tên'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              style: TextStyle(color: Colors.grey),
              controller: txtPhone,
              decoration: InputDecoration(
                label: Text('Số điện thoại'),
                border: OutlineInputBorder(),
                enabled: false,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: const Padding(
                padding: EdgeInsets.all(17),
                child: Text('Cập nhật', style: TextStyle(fontSize: 20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
