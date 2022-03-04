// ignore_for_file: avoid_print, sized_box_for_whitespace, prefer_const_constructors
// import 'dart:html';
import 'package:ban_laptop/models/cart.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ban_laptop/routes/product/payment.dart';
import 'package:flutter/material.dart';
import 'category_screen.dart';

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({Key? key}) : super(key: key);

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

  void loadData() {
    listDrop.add(
      const DropdownMenuItem(
        child: Text('Đồng tháp'),
        value: 1,
      ),
    );
    listDrop.add(
      const DropdownMenuItem(
        child: Text('Đồng tháp'),
        value: 2,
      ),
    );
  }

  loadCart() async {
    id = await storage.read(key: 'id');
    final data = await CallApi.getCart(id!);
    setState(() {
      lstCart = data;
      for (int i = 0; i < lstCart.length; i++) {
        tong += lstCart[i].soLuong * lstCart[i].sanPham.giaBan!;
      }
    });
  }

  int tong = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCart();
  }

  final f = new NumberFormat("#,##0", "vi_VN");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Giỏ hàng'),
        //elevation: 0.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        //backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 100),
        child: ListView.builder(
            itemCount: lstCart.length,
            itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          width: 80,
                          height: 90,
                          child: Image.network(
                            lstCart[index].sanPham.hinhAnh.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 255,
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  lstCart[index].sanPham.tenSanPham.toString(),
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
                                      margin: EdgeInsets.only(right: 20),
                                      width: 150,
                                      child: Text(
                                        f.format(
                                                lstCart[index].sanPham.giaBan) +
                                            ' VND',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15, left: 40),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      if (lstCart[index].soLuong > 1) {
                                        setState(() {
                                          lstCart[index].soLuong--;
                                          tong -=
                                              lstCart[index].sanPham.giaBan!;
                                        });
                                        String data = await CallApi.addCart(
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
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                          lstCart[index].soLuong.toString()),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      setState(() {
                                        lstCart[index].soLuong++;
                                        tong += lstCart[index].sanPham.giaBan!;
                                      });
                                      String data = await CallApi.addCart(
                                          id!,
                                          lstCart[index].sanPham.id.toString(),
                                          1);
                                    },
                                    child: const Icon(Icons.add_circle_rounded,
                                        color: Colors.grey, size: 20),
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
                                      String idPro =
                                          lstCart[index].sanPham.id.toString();
                                      setState(() {
                                        tong -= lstCart[index].sanPham.giaBan! *
                                            lstCart[index].soLuong;
                                        lstCart.removeAt(index);
                                      });
                                      String data =
                                          await CallApi.removeCart(id!, idPro);
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
                                              builder: (context) => Payment()));
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
                )),
      ),
      // ListView(
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           const Text("Sản phẩm",
      //               style: TextStyle(
      //                 fontSize: 20,
      //                 color: Colors.black,
      //               )),
      //           GestureDetector(
      //             onTap: () {},
      //             child: const Text(
      //               "Mua thêm sản phẩm",
      //               style: TextStyle(
      //                   color: Colors.blue,
      //                   decoration: TextDecoration.underline),
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //     //
      //     Padding(
      //       padding: const EdgeInsets.only(left: 10, right: 10),
      //       child: Column(
      //         children: [
      //           const SizedBox(
      //             child: Divider(
      //               thickness: 1,
      //               color: Colors.black,
      //             ),
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Container(
      //                 alignment: Alignment.centerLeft,
      //                 padding: const EdgeInsets.only(left: 10),
      //                 height: 80,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //                 child: Image.asset(
      //                   "assets/images/products/asus.jpg",
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: const <Widget>[
      //                   SizedBox(
      //                     width: 150,
      //                     child: Text(
      //                       "Asus ROG Strix Gaming G15 G513IH R7 4800H",
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     width: 150,
      //                     child: Text(
      //                       "21.000.000 đ",
      //                       style: TextStyle(
      //                           fontWeight: FontWeight.bold, color: Colors.red),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       InkWell(
      //                         onTap: (){},
      //                         child: const Icon(Icons.remove_circle_rounded,
      //                             color: Colors.grey, size: 20),
      //                       ),
      //                       Container(
      //                         width: 30,
      //                         height: 20,
      //                         decoration: BoxDecoration(
      //                           color: Colors.white,
      //                           borderRadius: BorderRadius.circular(5),
      //                         ),
      //                         child: const Center(
      //                           child: Text("1"),
      //                         ),
      //                       ),
      //                       InkWell(
      //                         onTap: (){},
      //                         child: const Icon(Icons.add_circle_rounded,
      //                             color: Colors.grey, size: 20),
      //                       ),
      //                     ],
      //                   ),
      //                   const SizedBox(
      //                     height: 5,
      //                   ),
      //                   ElevatedButton(
      //                     style: ButtonStyle(
      //                       shape: MaterialStateProperty.all<
      //                           RoundedRectangleBorder>(
      //                         RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(12.0),
      //                         ),
      //                       ),
      //                     ),
      //                     onPressed: () {},
      //                     child: const Text('Xóa'),
      //                   )
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 10, right: 10),
      //       child: Column(
      //         children: [
      //           const SizedBox(
      //             child: Divider(
      //               thickness: 1,
      //               color: Colors.black,
      //             ),
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Container(
      //                 alignment: Alignment.centerLeft,
      //                 padding: const EdgeInsets.only(left: 10),
      //                 height: 80,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //                 child: Image.asset(
      //                   "assets/images/products/macOs.jpg",
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: const <Widget>[
      //                   SizedBox(
      //                     width: 150,
      //                     child: Text(
      //                       "Apple MacBook Pro 16 M1 Pro 2021 10 core-CPU/16GB/512GB/16 core-GPU",
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     width: 150,
      //                     child: Text(
      //                       "31.990.000 đ",
      //                       style: TextStyle(
      //                           fontWeight: FontWeight.bold, color: Colors.red),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       InkWell(
      //                         onTap: (){},
      //                         child: const Icon(Icons.remove_circle_rounded,
      //                             color: Colors.grey, size: 20),
      //                       ),
      //                       Container(
      //                         width: 30,
      //                         height: 20,
      //                         decoration: BoxDecoration(
      //                           color: Colors.white,
      //                           borderRadius: BorderRadius.circular(5),
      //                         ),
      //                         child: const Center(
      //                           child: Text("1"),
      //                         ),
      //                       ),
      //                       InkWell(
      //                         onTap: (){},
      //                         child: const Icon(Icons.add_circle_rounded,
      //                             color: Colors.grey, size: 20),
      //                       ),
      //                     ],
      //                   ),
      //                   const SizedBox(
      //                     height: 5,
      //                   ),
      //                   ElevatedButton(
      //                     style: ButtonStyle(
      //                       shape: MaterialStateProperty.all<
      //                           RoundedRectangleBorder>(
      //                         RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(12.0),
      //                         ),
      //                       ),
      //                     ),
      //                     onPressed: () {},
      //                     child: const Text('Xóa'),
      //                   )
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 10, right: 10),
      //       child: Column(
      //         children: [
      //           const SizedBox(
      //             child: Divider(
      //               thickness: 1,
      //               color: Colors.black,
      //             ),
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Container(
      //                 alignment: Alignment.centerLeft,
      //                 padding: const EdgeInsets.only(left: 10),
      //                 height: 80,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //                 child: Image.asset(
      //                   "assets/images/products/macOs.jpg",
      //                   fit: BoxFit.cover,
      //                 ),
      //               ),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: const <Widget>[
      //                   SizedBox(
      //                     width: 150,
      //                     child: Text(
      //                       "Apple MacBook Pro 16 M1 Pro 2021 10 core-CPU/16GB/512GB/16 core-GPU",
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     width: 150,
      //                     child: Text(
      //                       "31.990.000 đ",
      //                       style: TextStyle(
      //                           fontWeight: FontWeight.bold, color: Colors.red),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       InkWell(
      //                         onTap: (){},
      //                         child: const Icon(Icons.remove_circle_rounded,
      //                             color: Colors.grey, size: 20),
      //                       ),
      //                       Container(
      //                         width: 30,
      //                         height: 20,
      //                         decoration: BoxDecoration(
      //                           color: Colors.white,
      //                           borderRadius: BorderRadius.circular(5),
      //                         ),
      //                         child: const Center(
      //                           child: Text("1"),
      //                         ),
      //                       ),
      //                       InkWell(
      //                         onTap: (){},
      //                         child: const Icon(Icons.add_circle_rounded,
      //                             color: Colors.grey, size: 20),
      //                       ),
      //                     ],
      //                   ),
      //                   const SizedBox(
      //                     height: 5,
      //                   ),
      //                   ElevatedButton(
      //                     style: ButtonStyle(
      //                       shape: MaterialStateProperty.all<
      //                           RoundedRectangleBorder>(
      //                         RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(12.0),
      //                         ),
      //                       ),
      //                     ),
      //                     onPressed: () {},
      //                     child: const Text('Xóa'),
      //                   )
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),

      //     const SizedBox(
      //       height: 120,
      //     ),
      //   ],
      // ),

      bottomSheet: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: const Payment(),
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
