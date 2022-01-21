import 'package:ban_laptop/main.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'forgot_password_1.dart';

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

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                    const Text(
                      "Nhập Email/Số Điện Thoại",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Nhập Email/Số Điện Thoại",
                      ),
                      controller: account,
                      
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Nhập Mật Khẩu",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
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
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: const ForgotPassword1(),
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
            onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: const HomePage()));
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
    );
  }
}
