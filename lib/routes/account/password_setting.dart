// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:convert';

import 'package:ban_laptop/routes/login_signup/login_signup.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();

class PasswordSetting extends StatefulWidget {
  const PasswordSetting({Key? key}) : super(key: key);

  @override
  _PasswordSettingState createState() => _PasswordSettingState();
}

class _PasswordSettingState extends State<PasswordSetting> {
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;
  String? id;
  getId() async {
    setState(() {});
    id = await storage.read(key: "id");
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    _passwordVisible1 = true;
    _passwordVisible2 = true;
    getId();
  }

  TextEditingController old_pass = TextEditingController();

  TextEditingController new_pass = TextEditingController();

  TextEditingController again_pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Thay đổi mật khẩu'),
        ),
        body: ListView(key: _formKey, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                autofocus: true,
                obscureText: _passwordVisible,
                controller: old_pass,
                decoration: InputDecoration(
                  hintText: 'Mật khẩu hiện tại',
                  contentPadding: const EdgeInsets.only(left: 10, top: 15),
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
                height: 20,
              ),
              TextFormField(
                obscureText: _passwordVisible1,
                controller: new_pass,
                decoration: InputDecoration(
                  hintText: 'Mật khẩu mới',
                  contentPadding: const EdgeInsets.only(left: 10, top: 15),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible1
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible1 = !_passwordVisible1;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: _passwordVisible2,
                controller: again_pass,
                decoration: InputDecoration(
                  hintText: 'Lặp lại mật khẩu',
                  contentPadding: const EdgeInsets.only(left: 10, top: 15),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible2
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible2 = !_passwordVisible2;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                    onPressed: () async {
                      if (old_pass.text == "" ||
                          new_pass.text == "" ||
                          again_pass.text == "") {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.white,
                            title: const Text("Thông báo"),
                            content:
                                const Text("Vui lòng điền đầy đủ thông tin!"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else if (new_pass.text == again_pass.text) {
                        try {
                          final data = await CallApi.changePassword(
                              id!, old_pass.text, new_pass.text);
                            if (data.body == true) {
                              old_pass.text = "";
                              new_pass.text = "";
                              again_pass.text = "";
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Thông báo',
                                  ),
                                  content: Text(
                                      'Đã đổi mật khẩu thành công\n Vui lòng đăng nhập lại'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ).then((value) => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login_SignUp()),
                                  (Route<dynamic> route) => false));
                            } else {
                              old_pass.text = "";
                              new_pass.text = "";
                              again_pass.text = "";
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    'Thông báo',
                                  ),
                                  content: Text(
                                      'Mật khẩu cũ không chính xác\nVui lòng nhập lại'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                        } catch (e) {
                          old_pass.text = "";
                          new_pass.text = "";
                          again_pass.text = "";
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Thông báo',
                              ),
                              content: Text(
                                  'Mật khẩu cũ không chính xác\nVui lòng nhập lại'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      } else {
                        new_pass.text = "";
                        again_pass.text = "";
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              'Thông báo',
                            ),
                            content: Text(
                                'Mật khẩu mới không trùng nhau\nVui lòng nhập lại'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    // if (_formKey.currentState!.validate()) {
                    //   // Process data.
                    // }
                    // },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Đổi mật khẩu',
                        style: TextStyle(fontSize: 18),
                      ),
                    )),
              ]),
            ],
          ),
        ]));
  }
}
