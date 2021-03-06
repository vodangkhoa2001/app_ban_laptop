// ignore_for_file: unnecessary_new, non_constant_identifier_names, deprecated_member_use, prefer_const_constructors

// import 'package:ban_laptop/routes/login_signup/login.dart';
import 'dart:convert';

import 'package:ban_laptop/routes/login_signup/login_signup.dart';
import 'package:ban_laptop/screens/loading.dart';
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

  // _signUp() async {
  //   var data = {
  //     'HoTen': ho.text+' '+ten.text,
  //     'email': email.text,
  //     'SDT': sdt.text,
  //     'MatKhau': matKhau.text,
  //     'DiaChi':address.text+', '+commune.text+ ', ' + district.text+','+city.text,

  //   };
  //   var res = await CallApi().postData(data, 'account/register');
  //   var body = json.decode(res.body);
  //   if (body[ "message"] == "???? ????ng k?? th??nh c??ng.") {
  //     _showDialog('Message', '????ng k?? th??nh c??ng!');
  //   } else {
  //     _showDialog('Message', 'Failed!');
  //   }
  // }
  bool check = false;

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
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              //h???
                              child: TextField(
                                controller: ho,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  labelText: "H???",
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            //t??n
                            Expanded(
                              child: TextField(
                                controller: ten,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  labelText: "T??n",
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
                        labelText: "S??? ??i???n tho???i",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //nh???p m???t kh???u v?? nh???p l???i mk
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
                              labelText: "Nh???p M???t Kh???u",
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
                              labelText: "X??c nh???n m???t kh???u",
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
                        labelText: "T???nh/ Th??nh ph???",
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
                              labelText: "Qu???n/Huy???n",
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
                              labelText: "Ph?????ng/X??",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //?????a ch???
                    TextField(
                      controller: address,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "?????a ch???",
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
                "T??i ???? ?????c v?? ?????ng ?? v???i c??c ??i???u kho???n s??? d???ng v?? ch??nh\n s??ch b???o m???t th??ng tin c?? nh??n c???a khkmart.com.vn",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: check
                ? Loading()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 48),
                    ),
                    onPressed: () async {
                      setState(() {
                        check = true;
                      });
                      if (ten.text != "" &&
                          ho.text != "" &&
                          matKhau.text != "" &&
                          email.text != "" &&
                          sdt.text != "" &&
                          address.text != "" &&
                          commune.text != "" &&
                          district.text != "" &&
                          city.text != "") {
                        String data = await CallApi.signUp(
                            ho.text + ' ' + ten.text,
                            matKhau.text,
                            email.text,
                            sdt.text,
                            address.text +
                                ', ' +
                                commune.text +
                                ', ' +
                                district.text +
                                ', ' +
                                city.text);
                        if (data == "???? ????ng k?? th??nh c??ng.") {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login_SignUp()),
                              (route) => false);
                        } else {
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Container(
                                    width: 300,
                                    height: 60,
                                    child: Center(
                                      child:
                                          const Text('Email ???? ???????c ????ng k??'),
                                    ),
                                  ),
                                  actions: [
                                    Center(
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('????ng'),
                                      ),
                                    )
                                  ],
                                );
                              });
                        }
                        setState(() {
                        check = false;
                      });
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Container(
                                  width: 300,
                                  height: 60,
                                  child: Center(
                                    child: const Text(
                                        'B???n c???n ??i???n ?????y ????? th??ng tin'),
                                  ),
                                ),
                                actions: [
                                  Center(
                                    child: FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('????ng'),
                                    ),
                                  )
                                ],
                              );
                            });
                      }
                      setState(() {
                        check = false;
                      });
                    },
                    child: const Text(
                      '????ng K??',
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
              Text("Ho???c"),
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
                "T???i App KHK Mart ????? mua h??ng thu???n ti???n h??n!\n Truy c???p http://khkmart.com ????? xem cho ????.",
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
