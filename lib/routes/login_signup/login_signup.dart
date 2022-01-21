import 'dart:ui';

// import 'package:ban_laptop/main.dart';
import 'package:ban_laptop/routes/login_signup/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'login.dart';
import 'sign_up.dart';

bool? isChecked = false;

// ignore: camel_case_types
class Login_SignUp extends StatefulWidget {
  const Login_SignUp({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _Login_SignUpState createState() => _Login_SignUpState();
}

// ignore: camel_case_types
class _Login_SignUpState extends State<Login_SignUp> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              Tab(
                  icon: Text(
                "Đăng Nhập",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
              Tab(
                  icon: Text(
                "Đăng Kí",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
            ],
          ),
          title: const Text(
            "KHK mart",
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Login(),
            SignUp()
          ],
        ),
      ),
    );
  }
}
