// ignore_for_file: sized_box_for_whitespace, no_logic_in_create_state, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:async';

import 'package:ban_laptop/main.dart';
import 'package:ban_laptop/models/cart.dart';
import 'package:ban_laptop/models/product/product.dart';
import 'package:ban_laptop/routes/product/payment.dart';
import 'package:ban_laptop/screens/account.dart';
import 'package:ban_laptop/screens/loading.dart';
import 'package:ban_laptop/screens/shopping.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import 'package:ban_laptop/screens/shopping.dart';

class Details extends StatefulWidget {
  Details({Key? key, required this.product, required this.banner})
      : super(key: key);
  Product product;
  String banner;

  @override
  _DetailsState createState() => _DetailsState(product, banner);
}

class _DetailsState extends State<Details> {
  Product product;
  String banner;
  _DetailsState(this.product, this.banner);
  final f = new NumberFormat("#,##0", "vi_VN");
  final storage = FlutterSecureStorage();
  String? id;
  bool check = false;
  void loading() {
    setState(() {
      check = true;
    });
    Future.delayed(Duration(seconds: 1), stop);
  }

  void loading2() {
    setState(() {
      check = true;
    });
    Future.delayed(Duration(seconds: 1), toChat);
  }

  toChat() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage(tab: 2)),
        (route) => false);
  }

  void stop() {
    setState(() {
      check = false;
    });
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              width: 300,
              height: 80,
              child: Column(
                children: [
                  Text('???? th??m th??nh c??ng'),
                  SizedBox(height: 10),
                  Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green[400],
                    size: 40,
                  )
                ],
              ),
            ),
            actions: [
              Center(
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: const Text('Chi ti???t s???n ph???m'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 350,
                        height: 300,
                        child: AspectRatio(
                          aspectRatio: 1.02,
                          child: Image.network('${product.hinhAnh}'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '${product.tenSanPham}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 700,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 1, //B??n k??nh lan r???ng
                          blurRadius: 4, //L??m m??? b??n k??nh
                          offset:
                              const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: banner == "M???i" || banner == ""
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                f.format(product.giaBan) + ' VND',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  decorationColor: Colors.white,
                                  color: Colors.white,
                                  decorationStyle: TextDecorationStyle.solid,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                f.format(product.giaBan) + ' VND',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.white,
                                  color: Colors.white,
                                  decorationStyle: TextDecorationStyle.solid,
                                ),
                              ),
                              Text(
                                f.format(product.giaNhap) + ' VND',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    height: 50,
                    width: 700,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 1, //B??n k??nh lan r???ng
                          blurRadius: 4, //L??m m??? b??n k??nh
                          offset:
                              const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "M?? t??? s???n ph???m",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      // 'HI???U N??NG ???N T?????NG T??? CHIP M1'
                      // '\n\nChip M1 ???????c Apple thi???t k??? d??nh ri??ng cho MacBook mang ?????n hi???u n??ng v?????t tr???i. Th???c hi???n t???t c??c t??c v??? v??n ph??ng tr??n c??c ph???n m???m nh?? Word, Excel, Powerpoint,... Thi???t k??? ????? ho??? c??ng chuy??n nghi???p kh??ng k??m, cho ph??p b???n ch???nh s???a h??nh ???nh v???i dung l?????ng l???n, k???t xu???t 2D m?????t m?? tr??n c??c ph???n m???m Photoshop, AI, Figma,...'
                      // '\n\n Card ????? h???a GPU 7 nh??n ??em l???i hi???u su???t cao ????ng kinh ng???c, ????? h???a cao h??n g???p 5 l???n, th???o s???c s??ng t???o n???i dung, k???t xu???t 3D ???n ?????nh, render video, ph??t tr???c ti???p v???i ch???t l?????ng cao v???i ch???t ???nh s???c n??t c??ng ????? ph??n gi???i l??n ?????n 4K.'
                      // '\n\nB??? nh??? RAM 16 GB cho ph??p b???n s??? d???ng ??a nhi???m, b???n c?? th??? thao t??c nhi???u ???ng d???ng c??ng m???t l??c tho???i m??i v???i nh???ng t??c v??? nh?? l?????t web, so???n th???o v??n b???n, xem video hay thi???t k??? h??nh ???nh b???ng Photoshop, Adobe IIIustrator,...'
                      // '\n\n??? c???ng SSD 256 GB gi??p m??y c?? t???c ????? ?????c ghi nhanh ch??ng ?????ng th???i mang l???i kh??ng gian b??? nh??? ????? l???n ph???c v??? cho nhu c???u l??u tr??? c???a b???n nh?? t??i li???u trong h???c t???p, d??? li???u trong c??ng vi???c, c??c b??? phim ho???c b???n nh???c trong gi???i tr??. ?????ng th???i, ti???t ki???m ???????c th???i gian kh???i ?????ng m??y ho???c m??? c??c ???ng d???ng n???ng, c???i thi???n ???????c th???i gian m??? nhanh ch??ng h??n.'
                      // '\n\nFaceTime Camera cho h??nh ???nh r?? n??t k???t h???p v???i 3 microphone thu???n ti???n cho nhu c???u h???p ho???c h???c online hay h???i ????m tr???c tuy???n, gi???i quy???t hi???u qu??? c??ng vi???c t??? xa qua c??c ph???n m???n Zoom, Google Meet,...'
                      // '\n\nH??? th???ng loa k??p cho ??m thanh to r??, s???ng ?????ng ????? b???n c?? tr???i nghi???m nghe nh???c, xem phim v?? g???i ??i???n tr???c tuy???n tho???i m??i v???i ??m thanh ch???t l?????ng cao. T???o cho b???n c???m gi??c ?????m ch??m trong nh???ng ch????ng tr??nh gi???i tr?? h???p d???n.',
                      '${product.moTa}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    height: 50,
                    width: 700,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 1, //B??n k??nh lan r???ng
                          blurRadius: 4, //L??m m??? b??n k??nh
                          offset:
                              const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Th??ng tin chi ti???t",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 600,
                    child: DataTable(
                      border: const TableBorder(
                        horizontalInside: BorderSide(color: Colors.blue),
                        //right: BorderSide(color: Colors.blue.shade400),
                        //bottom: BorderSide(color: Colors.blue.shade400),
                        //top: BorderSide(color: Colors.blue.shade400),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[90],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      columns: const [
                        DataColumn(
                          label: Text(
                            'T??n',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Th??ng s???',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('M??u')),
                          DataCell(Text('${product.tenMau}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('CPU')),
                          DataCell(Text('${product.tenCPU}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('RAM')),
                          DataCell(Text('${product.tenRam}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('??? C???ng')),
                          DataCell(Text('${product.tenOCung}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('M??n h??nh')),
                          DataCell(Text('${product.tenManHinh}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Card ????? h???a')),
                          DataCell(Text('${product.tenCardManHinh}')),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    height: 50,
                    //width: 234,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 1, //B??n k??nh lan r???ng
                          blurRadius: 4, //L??m m??? b??n k??nh
                          offset:
                              const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "????nh gi?? s???n ph???m",
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 28.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 28.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 28.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 28.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 28.0,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 160,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey.shade300)),
                child: ListView(
                  children: [
                    Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/images/avatars/avatar_user_1.jpg'),
                        ),
                        title: Text(
                          'Tr???n Hi???u Khoa\t 5 ph??t',
                          style: TextStyle(fontSize: 12),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text('S???n ph???m s??? d???ng t???t'),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.reply),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Card(
                            color: Colors.grey[200],
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              title: Text(
                                'Admin\t 2 ph??t',
                                style: TextStyle(fontSize: 12),
                              ),
                              subtitle: Text('C???m ??n b???n ???? ????nh gi?? s???n ph???m'),
                              trailing: Icon(Icons.reply),
                            ))),
                  ],
                )),
            SizedBox(height: 100)
          ],
        ),
        bottomSheet: Table(
          border: const TableBorder(top: BorderSide(color: Colors.blue)),
          children: [
            TableRow(children: [
              FlatButton(
                  onPressed: () {
                    loading2();
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Icon(
                        Icons.chat,
                        color: Colors.grey,
                      ))),
              FlatButton(
                  onPressed: () async {
                    id = await storage.read(key: 'id');
                    final snackBar = SnackBar(
                      content: Text('Th??m s???n ph???m th??nh c??ng'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    String data =
                        await CallApi.addCart(id!, product.id.toString(), 1);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.blue,
                      ))),
              FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              width: 300,
                              height: 60,
                              child: Center(
                                child: Text('B???n c?? ch???c mua ngay ?'),
                              ),
                            ),
                            actions: [
                              Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FlatButton(
                                    onPressed: () {
                                      Cart cart = new Cart(sanPham:product, soLuong: 1);
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Payment(lstCart: [],
                                                    cartItem: cart,
                                                  )));
                                    },
                                    child: Text('OK'),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('????ng'),
                                  ),
                                ],
                              ))
                            ],
                          );
                        });
                  },
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        'Mua ngay',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))),
            ]),
          ],
        ),
      ),
      if (check) Loading2() else Padding(padding: EdgeInsets.zero)
    ]);
  }
}

Widget Loading2() {
  return Center(
    child: Container(
      width: 300,
      height: 140,
      alignment: AlignmentDirectional.center,
      decoration: new BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: CircularProgressIndicator(),
    ),
  );
}
