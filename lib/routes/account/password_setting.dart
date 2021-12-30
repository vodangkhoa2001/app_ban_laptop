import 'package:flutter/material.dart';

class PasswordSetting extends StatefulWidget {
  const PasswordSetting({Key? key}) : super(key: key);

  @override
  _PasswordSettingState createState() => _PasswordSettingState();
}

class _PasswordSettingState extends State<PasswordSetting> {
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;
  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = true;
    _passwordVisible1 = true;
    _passwordVisible2 = true;
  }

  // ignore: non_constant_identifier_names, unnecessary_new
  TextEditingController present_pass = new TextEditingController();
  // ignore: non_constant_identifier_names, unnecessary_new
  TextEditingController new_pass = new TextEditingController();
  // ignore: non_constant_identifier_names, unnecessary_new
  TextEditingController again_pass = new TextEditingController();
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
                controller: present_pass,
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Trường này không được bỏ trống';
                  }
                  return null;
                },
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Trường này không được bỏ trống';
                  }
                  return null;
                },
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Trường này không được bỏ trống';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                      }
                    },
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
