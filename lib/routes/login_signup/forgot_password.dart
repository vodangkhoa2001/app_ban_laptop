// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'forgot_password_2.dart';
import 'login_signup.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();
  bool validate = false;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Quên mật khẩu',
          ),
        ),
        body: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      label: Text('Email'),
                      hintText: 'Nhập Email của bạn',
                      errorText: validate ? "Email sai" : null,
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    validate = email.text.isEmpty?true:false;
                  });
                },
                child: Text(
                  'Xác nhận',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                color: Colors.blue,
                height: 50,
              ),
            )
          ],
        ));
  }
}
