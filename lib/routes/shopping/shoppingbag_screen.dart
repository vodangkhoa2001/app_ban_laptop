import 'dart:html';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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
  String? _khuVuc;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Giỏ hàng'),
        //elevation: 0.0,
        //backgroundColor: Colors.grey,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: const Category(),
              ),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Sản phẩm",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Mua thêm sản phẩm",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 10),
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "assets/images/products/asus.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        SizedBox(
                          width: 150,
                          child: Text(
                            "Asus ROG Strix Gaming G15 G513IH R7 4800H",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            "32.000.000 đ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.remove,
                                  color: Colors.white, size: 15),
                            ),
                            Container(
                              width: 30,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text("1"),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.add,
                                  color: Colors.white, size: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Xóa'),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 10),
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "assets/images/products/macOs.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        SizedBox(
                          width: 150,
                          child: Text(
                            "Apple MacBook Pro 16 M1 Pro 2021 10 core-CPU/16GB/512GB/16 core-GPU",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            "64.990.000 đ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.remove,
                                  color: Colors.white, size: 15),
                            ),
                            Container(
                              width: 30,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text("1"),
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.add,
                                  color: Colors.white, size: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Xóa'),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 200,
            //color: Colors.grey,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: '  Nhập mã giảm giá',
                        ),
                      ),
                    ),
                    Positioned(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(90, 48),
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        // ignore: avoid_print
                        onPressed: () => print('Chưa nhập mã'),
                        child: const Text('Áp dụng'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Tổng giá trị sản phẩm",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "18.000.000 đ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Tạm tính",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "18.000.000 đ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 200,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "THÔNG TIN NHẬN HÀNG",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            hintText: '  Họ tên người nhận hàng',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            hintText: '  Số điện thoại',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      "Giao hàng tận nơi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Nhận tại cửa hàng",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    // ListTile(
                    //   leading: Radio<String>(
                    //     value: 'Giao hàng tận nơi',
                    //     groupValue: _khuVuc,
                    //     onChanged: (String? value) {
                    //       setState(() {
                    //         _khuVuc = value;
                    //       });
                    //     },
                    //   ),
                    //   title: const Text('Giao hàng tận nơi'),
                    // ),
                    // ListTile(
                    //   title: const Text('Nhận tại cửa hàng'),
                    //   leading: Radio<String>(
                    //     value: 'Nhận tại cửa hàng',
                    //     groupValue: _khuVuc,
                    //     onChanged: (String? value) {
                    //       setState(
                    //         () {
                    //           _khuVuc = value;
                    //         },
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DropdownButton(
                            icon: const Icon(Icons.arrow_drop_down_circle),
                            items: listDrop,
                            hint: const Text("Chọn Tỉnh/Thành phố"),
                            onChanged: (value) => print('Bạn chọn: $value'),
                          ),
                          DropdownButton(
                            items: listDrop,
                            icon: const Icon(Icons.arrow_drop_down_circle),
                            hint: const Text("    Chọn Quận/Huyện  "),
                            onChanged: (value) => print('Bạn chọn: $value'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DropdownButton(
                            items: listDrop,
                            icon: const Icon(Icons.arrow_drop_down_circle),
                            hint: const Text("     Chọn Phường/Xã  "),
                            onChanged: (value) => print('Bạn chọn: $value'),
                          ),
                          Container(
                            width: 170,
                            height: 30,
                            child: const TextField(
                              decoration: InputDecoration(
                                // contentPadding: const EdgeInsets.all(0),
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(10.0),
                                // ),
                                hintText: '   Địa chỉ',
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Ghi chú đơn hàng (Nếu có)',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 200,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "PHƯƠNG THỨC THANH TOÁN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                ListTile(
                  leading: Radio<String>(
                    value: 'Thanh toán khi nhận hàng',
                    groupValue: _khuVuc,
                    onChanged: (String? value) {
                      setState(() {
                        _khuVuc = value;
                      });
                    },
                  ),
                  title: const Text(
                      'Thanh toán khi nhận hàng (Bạn sẽ thanh toán tiền mặt khi nhận hàng)'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: 200,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Bằng cách đặt mua, bạn đồng ý với Điều khoản sử dụng và Chính sách bảo mật thông tin cá nhân của KHKmart.com.vn",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Thành tiền",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "18.000.000 đ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            height: 50,
            minWidth: 100,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(15),
            // ),
            child: const Text(
              "Đặt mua",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
