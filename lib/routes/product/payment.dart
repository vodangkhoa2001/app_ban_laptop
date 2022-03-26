// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print, prefer_const_constructors, deprecated_member_use

import 'package:ban_laptop/main.dart';
import 'package:ban_laptop/models/account/account.dart';
import 'package:ban_laptop/models/cart.dart';
import 'package:ban_laptop/models/invoice/invoice.dart';
import 'package:ban_laptop/models/product/product.dart';
import 'package:ban_laptop/routes/account/order.dart';
import 'package:ban_laptop/routes/account/order_detail.dart';
import 'package:ban_laptop/routes/product/category_screen.dart';
import 'package:ban_laptop/screens/account.dart';
import 'package:ban_laptop/screens/loading.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class Payment extends StatefulWidget {
  Payment({Key? key, required this.lstCart, this.cartItem}) : super(key: key);
  List<Cart> lstCart = [];
  Cart? cartItem;
  @override
  State<Payment> createState() => _PaymentState(lstCart, cartItem);
}

enum GiaoNhan { nhantaicuahang, giaotannoi }
enum ThanhToan { thanhtoanbangtien }

final storage = FlutterSecureStorage();

class _PaymentState extends State<Payment> {
  ThanhToan? _thanhtoan = ThanhToan.thanhtoanbangtien;
  List<Cart> lstCart = [];
  Cart? cartItem;
  _PaymentState(this.lstCart, this.cartItem);

  final f = new NumberFormat("#,##0", "vi_VN");
  String? id;
  UserAccount? user;
  loadInfoUser() async {
    id = await storage.read(key: 'id');
    final data = await CallApi.getUserInfo(id!);
    setState(() {
      user = data;
      name.text = user!.fullName;
      phone.text = user!.phone;
      address.text = user!.address;
    });
  }

  bool check = false;
  void loading() {
    setState(() {
      check = true;
    });
    Future.delayed(Duration(seconds: 2), stop);
  }

  void stop() {
    setState(() {
      check = false;
    });
  }

  void loadingPay() {
    setState(() {
      check = true;
    });
    Future.delayed(Duration(seconds: 1), stopPay);
  }

  void stopPay() {
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
                  Text('Hoàn tất đặt hàng'),
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
                    

                        // Navigator.pop(context);
                        Navigator.pop(context);
                    Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Order()))
                        .then((value) {
                      setState(() {
                      });
                    });
                  },
                  child: Text('OK'),
                ),
              )
            ],
          );
        });
  }

  TextEditingController name = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController note = new TextEditingController();
  int tong = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading();
    lstCart.isNotEmpty ? lstCart : lstCart.add(cartItem!);
    for (int i = 0; i < lstCart.length; i++) {
      tong += lstCart[i].soLuong * lstCart[i].sanPham.giaBan!;
      loadInfoUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
      ),
      body: check
          ? Loading()
          : SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lstCart.length,
                      itemBuilder: ((context, index) => Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 15),
                                  width: 80,
                                  height: 90,
                                  child: Image.network(
                                    lstCart[index].sanPham.hinhAnh.toString(),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 190,

                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          lstCart[index]
                                              .sanPham
                                              .tenSanPham
                                              .toString(),
                                          // style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        // margin: EdgeInsets.only(top: 15),
                                        height: 50,
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 20),
                                              width: 120,
                                              child: Text(
                                                f.format(lstCart[index]
                                                        .sanPham
                                                        .giaBan) +
                                                    ' VND',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 15, left: 40),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              if (lstCart[index].soLuong > 1) {
                                                setState(() {
                                                  lstCart[index].soLuong--;
                                                  tong -= lstCart[index]
                                                      .sanPham
                                                      .giaBan!;
                                                });
                                                String data =
                                                    await CallApi.addCart(
                                                        id!,
                                                        lstCart[index]
                                                            .sanPham
                                                            .id
                                                            .toString(),
                                                        -1);
                                              }
                                            },
                                            child: const Icon(
                                                Icons.remove_circle_rounded,
                                                color: Colors.grey,
                                                size: 20),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(lstCart[index]
                                                  .soLuong
                                                  .toString()),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              setState(() {
                                                lstCart[index].soLuong++;
                                                tong += lstCart[index]
                                                    .sanPham
                                                    .giaBan!;
                                              });
                                              String data =
                                                  await CallApi.addCart(
                                                      id!,
                                                      lstCart[index]
                                                          .sanPham
                                                          .id
                                                          .toString(),
                                                      1);
                                            },
                                            child: const Icon(
                                                Icons.add_circle_rounded,
                                                color: Colors.grey,
                                                size: 20),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              String idPro = lstCart[index]
                                                  .sanPham
                                                  .id
                                                  .toString();
                                              setState(() {
                                                tong -= lstCart[index]
                                                        .sanPham
                                                        .giaBan! *
                                                    lstCart[index].soLuong;
                                                lstCart.removeAt(index);
                                              });
                                              String data =
                                                  await CallApi.removeCart(
                                                      id!, idPro);
                                            },
                                            child: Icon(
                                              Icons.delete_rounded,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("THÔNG TIN KHÁCH HÀNG"),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          child: TextField(
                            controller: name,
                            decoration: InputDecoration(
                              icon: Icon(Icons.person_rounded),
                              border: OutlineInputBorder(),
                              hintText: 'Họ tên',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          child: TextField(
                            controller: phone,
                            decoration: InputDecoration(
                              icon: Icon(Icons.call_rounded),
                              border: OutlineInputBorder(),
                              hintText: 'Số điện thoại',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 40,
                          child: TextField(
                            controller: address,
                            decoration: InputDecoration(
                              icon: Icon(Icons.place_rounded),
                              border: OutlineInputBorder(),
                              hintText: 'Địa chỉ',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller: note,
                            textAlignVertical: TextAlignVertical.top,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              alignLabelWithHint: true,
                              hintText: 'Ghi chú đơn hàng(nếu có)',
                            ),
                          ),
                        ),
                        //dia chi
                        //phương thức thanh toán
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("PHƯƠNG THỨC THANH TOÁN"),
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: ThanhToan.thanhtoanbangtien,
                                  groupValue: _thanhtoan,
                                  onChanged: (ThanhToan? value) {
                                    setState(() {
                                      _thanhtoan = value;
                                    });
                                  },
                                ),
                                const Text("Thanh toán khi nhận hàng"),
                              ],
                            ),
                            const Text(
                              "bạn sẽ thanh toán bằng tiền mặt khi nhân hàng",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        //ket thuc phuong thuc thanh toan
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: RichText(
                            text: const TextSpan(
                              text: '(Bằng cách đặt mua, Bạn đồng ý với',
                              style: TextStyle(color: Colors.black),
                              /*defining default style is optional */
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Điều khoản sử dụng',
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(
                                    text: ' và',
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                                TextSpan(
                                    text:
                                        ' Chính sách bảo mật thông tin cá nhân',
                                    style: TextStyle(color: Colors.blue)),
                                TextSpan(
                                  text: ' của KHKmart.com.vn)',
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Thành Tiền",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  f.format(tong) + " VND",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        child: MaterialButton(
          onPressed: () async {
            loadingPay();
            String? idInvoice = await CallApi.addInvoice(
                id!, address.text, phone.text, tong, note.text);

            if (idInvoice != "") {
              for (int i = 0; i < lstCart.length; i++) {
                CallApi.addInvoiceDetail(idInvoice, lstCart[i].sanPham.id!,
                    lstCart[i].soLuong, lstCart[i].sanPham.giaBan!, 0);
                CallApi.removeCart(id!, lstCart[i].sanPham.id!);
              }
              lstCart.clear();
            }
          },
          color: Colors.blue,
          height: 50,
          minWidth: 100,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(15),
          // ),
          child: const Text(
            "Đặt hàng",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
