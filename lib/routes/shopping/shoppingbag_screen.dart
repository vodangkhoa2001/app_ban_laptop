import 'package:flutter/material.dart';

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({Key? key}) : super(key: key);

  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Giỏ hàng'),
        //elevation: 0.0,
        // backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
          onPressed: () {},
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
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
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
                        fontSize: 15,
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
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            height: 50,
            minWidth: 100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
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
