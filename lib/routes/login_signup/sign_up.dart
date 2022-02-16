// ignore_for_file: unnecessary_new, non_constant_identifier_names

// import 'package:ban_laptop/routes/login_signup/login.dart';
import 'dart:convert';

import 'package:ban_laptop/services/api.dart';
import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? isChecked = false; // kiem tra dieu kien
  bool _passwordVisible = false;
  bool _passwordVisible1 = false;
  TextEditingController ho = TextEditingController(); 
  TextEditingController ten = TextEditingController(); //ho
  TextEditingController matKhau = TextEditingController(); //mat khau
  TextEditingController tenDangNhap = TextEditingController(); //ten
  TextEditingController email = TextEditingController(); //email
  TextEditingController sdt = TextEditingController();
  TextEditingController xn_matKhau = TextEditingController(); //lap lai mat khau
  TextEditingController city = TextEditingController(); //thanh pho
  TextEditingController district = TextEditingController(); //huyen
  TextEditingController commune = TextEditingController(); //xa
  TextEditingController address = TextEditingController(); //dia chi

  void _showDialog(title, content) {
    // user defined function void (BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("$title"),
          content: new Text("$content"),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _passwordVisible = true;
    _passwordVisible1 = true;
    isChecked = true;
    super.initState();
  }

  _signUp() async {
    var data = {
      'HoTen': ho.text+' '+ten.text,
      'TenDangNhap': tenDangNhap.text,
      'email': email.text,
      'SDT': sdt.text,
      'MatKhau': matKhau.text,
      'DiaChi':address.text+', '+commune.text+ ', ' + district.text+','+city.text,
      
       
    };
    var res = await CallApi().postData(data, 'account/sign-up');
    var body = json.decode(res.body);
    if (body['success'] == true) {
      _showDialog('Message', 'Success!');
    } else {
      _showDialog('Message', 'Failed!');
    }
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
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: tenDangNhap,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Tên đăng nhập",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          
                          Expanded(
                            //họ
                            child: TextField(
                              controller: ho,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                labelText: "Họ",
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          //tên
                          Expanded(
                            
                            child: TextField(
                              controller: ten,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                labelText: "Tên",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //email
                  TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //phone
                  TextField(
                    controller: sdt,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Số điện thoại",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //nhập mật khẩu và nhập lại mk
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: matKhau,
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
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: xn_matKhau,
                          obscureText: _passwordVisible1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(),
                            labelText: "Xác nhận mật khẩu",
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //thanh pho
                  TextField(
                    controller: city,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Tỉnh/ Thành phố",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //quan huyen va phuong xa
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: district,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: "Quận/Huyện",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: commune,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            labelText: "Phường/Xã",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //địa chỉ
                  TextField(
                    controller: address,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: "Địa chỉ",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                }),
            const Text(
              "Tôi đã đọc và đồng ý với các Điều khoản sử dụng và chính\n sách bảo mật thông tin cá nhân của khkmart.com.vn",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 48),
            ),
            onPressed: () {
              _signUp();
            },
            child: const Text(
              'Đăng Kí',
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
