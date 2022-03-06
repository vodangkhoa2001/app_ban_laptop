// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:convert';

import 'package:ban_laptop/main.dart';
import 'package:ban_laptop/screens/loading.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:page_transition/page_transition.dart';

import 'forgot_password.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? isChecked = false;
  bool _passwordVisible = false;
  TextEditingController account = TextEditingController(); //email or phone
  TextEditingController password = TextEditingController();

  get formKey => null;

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  String message = '';
  bool checkAccount = false;
  bool checkPassword = false;

// Create storage
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: ListView(
        children: [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: account,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          labelText: "Nhập Email",
                          errorText: checkAccount == true
                              ? 'Email không được bỏ trống'
                              : null,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: password,
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(),
                          labelText: "Nhập Mật Khẩu",
                          errorText: checkPassword == true
                              ? 'Mật khẩu không được bỏ trống'
                              : null,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: const ForgotPassword(),
                            ),
                          );
                        },
                        child: const Text(
                          "Quên mật khẩu?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 48),
              ),
              onPressed: () async {
                setState(() {
                  account.text == ''
                      ? checkAccount = true
                      : checkAccount = false;
                  password.text == ''
                      ? checkPassword = true
                      : checkPassword = false;
                });
                if (account.text != '' && password.text != '') {
                  final data = await CallApi.login(account.text, password.text);
                  
                  if (data.statusCode == 200) {
                     Map<String, dynamic> responseData = jsonDecode(data.body);
                    await storage.write(key: 'id', value: responseData["0"]);
                    // await storage.write(key: 'Email', value: data[2]);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoadingHome()),
                        (Route<dynamic> route) => false);
                  } else {
                    
                    showDialog(
                      context: context,
                      builder: (context) => Container(
                          width: 200,
                          child: AlertDialog(
                            title: const Text(
                              'Thông báo',
                            ),
                            content:
                                Text('Email hoặc mật khẩu không chính xác'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          )),
                    );
                  }
                }
                // else{
                //   showDialog(
                //         context: context,
                //         builder: (context) => Container(
                //               width: 200,
                //               child: AlertDialog(
                //                 title: const Text(
                //                   'Thông báo',
                //                 ),
                //                 content: Text(
                //                     'Email hoặc mật khẩu không được bỏ trống'),
                //                 actions: <Widget>[
                //                   TextButton(
                //                     onPressed: () => Navigator.pop(context, 'OK'),
                //                     child: const Text('OK'),
                //                   ),
                //                 ],
                //               ),
                //             ));
                // }
              },
              child: const Text(
                'Đăng Nhập',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Hoặc"),
            ],
          ),
          Column(
            children: const [
              SizedBox(
                width: 300,
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.facebook, color: Colors.blue),
                iconSize: 50,
              ),
              const SizedBox(
                width: 80,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/google_icon.png",
                  width: 40,
                ),
                iconSize: 50,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Tải App KHK Mart để mua hàng thuận tiện hơn!\n Truy cập http://khkmart.com để xem cho đã.",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/App_Store.png",
                  width: 120,
                  height: 150,
                ),
                const SizedBox(
                  width: 30,
                ),
                Image.asset(
                  "assets/images/CH_Play.png",
                  width: 120,
                  height: 150,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
