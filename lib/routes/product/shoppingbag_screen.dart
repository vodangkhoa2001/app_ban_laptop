// ignore_for_file: avoid_print, sized_box_for_whitespace, prefer_const_constructors
// import 'dart:html';
import 'package:ban_laptop/models/cart.dart';
import 'package:ban_laptop/routes/product/not_product.dart';
import 'package:ban_laptop/routes/product/product_detail.dart';
import 'package:ban_laptop/screens/loading.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ban_laptop/routes/product/payment.dart';
import 'package:flutter/material.dart';
import 'category_screen.dart';

class ShoppingBag extends StatefulWidget {
  ShoppingBag({Key? key}) : super(key: key);
  
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

//enum KhuVuc { TaiNha, TaiCuaHang }

class _ShoppingBagState extends State<ShoppingBag> {
  List<DropdownMenuItem<int>> listDrop = [];
  //late KhuVuc? _khuVuc = KhuVuc.TaiNha;
  // String? _khuVuc;
  final storage = FlutterSecureStorage();
  String? id;
  List<Cart> lstCart = [];
  loadCart() async {
    id = await storage.read(key: 'id');
    final data = await CallApi.getCart(id!);
    setState(() {
      lstCart.addAll(data);
      for (int i = 0; i < lstCart.length; i++) {
        tong += lstCart[i].soLuong * lstCart[i].sanPham.giaBan!;
      }
    });
  }

  bool check = false;
  void loading() {
    setState(() {
      check = true;
    });
    Future.delayed(Duration(seconds: 1), stop);
  }

  void stop() {
    setState(() {
      check = false;
    });
  }

  int tong = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loadCart();
      loading();
    });
  }

  final f = new NumberFormat("#,##0", "vi_VN");
  @override
  Widget build(BuildContext context) {
    return check
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: const Text('Giỏ hàng'),
              //elevation: 0.0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              //backgroundColor: Colors.grey,
            ),
            body: (lstCart.isEmpty)
                ? NotProduct()
                : Container(
                    padding: EdgeInsets.only(bottom: 100),
                    child: ListView.builder(
                        itemCount: lstCart.length,
                        itemBuilder: (context, index) =>
                        InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details(
                                            product: lstCart[index].sanPham,
                                            banner: "")));
                              },
                              child: Card(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 15),
                                      width: 80,
                                      height: 90,
                                      child: Image.network(
                                        lstCart[index]
                                            .sanPham
                                            .hinhAnh
                                            .toString(),
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
                                                  margin: EdgeInsets.only(
                                                      right: 20),
                                                  width: 110,
                                                  child: Text(
                                                    f.format( lstCart[index]
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
                                      margin: const EdgeInsets.only(
                                          top: 15, left: 40),
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
                                                  if (lstCart[index].soLuong >
                                                      1) {
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
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Payment(
                                                                lstCart: [],
                                                                cartItem:
                                                                    lstCart[
                                                                        index],
                                                              )));
                                                },
                                                child: Icon(
                                                  Icons.monetization_on_rounded,
                                                  color: Colors.green[300],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                    ),
                  ),
            bottomSheet: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 90,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tổng giá trị sản phẩm",
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              f.format(tong) + " VND",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tạm tính",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              f.format(tong) + " VND",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),

                      ]),
                )
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: (lstCart.isEmpty)
                    ? MaterialButton(
                        onPressed: () {},
                        color: Colors.grey,
                        enableFeedback: false,
                        child: const Text(
                          "Đặt mua tất cả",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )
                    : MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: Payment(
                                lstCart: lstCart,
                              ),
                            ),
                          );
                        },
                        color: Colors.blue,
                        height: 50,
                        minWidth: 100,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        child: const Text(
                          "Đặt mua tất cả",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                       child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: Payment(
                          lstCart: lstCart,
                        ),
                      ),
                    );
                  },
                  color: Colors.blue,
                  height: 50,
                  minWidth: 100,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(15),
                  // ),
                  child: const Text(
                    "Đặt mua tất cả",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
