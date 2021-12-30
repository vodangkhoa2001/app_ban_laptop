import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum GiaoNhan { nhantaicuahang, giaotannoi }
enum ThanhToan { thanhtoanbangtien }

class _MyHomePageState extends State<MyHomePage> {
  GiaoNhan? _character = GiaoNhan.giaotannoi;
  ThanhToan? _thanhtoan = ThanhToan.thanhtoanbangtien;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sản Phẩm (2)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Mua thêm sản phẩm',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                  thickness: 2,
                  indent: 8,
                  endIndent: 10,
                  color: Colors.black,
                ),

                //danh sach san pham
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/products/1.png',
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                        "Laptop Gaming Asus ROG Strix G15 G513QC HN015T Laptop Gaming Asus ROG Strix G15 G513QC HN015T"),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            padding: const EdgeInsets.only(
                                                bottom: 12),
                                            iconSize: 18,
                                            onPressed: () {},
                                            icon: const Icon(Icons.minimize),
                                          ),
                                          //const SizedBox(width: 5),
                                          Text(
                                            '1',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                          //const SizedBox(width: 5),
                                          IconButton(
                                            iconSize: 18,
                                            onPressed: () {},
                                            icon:
                                                const Icon(Icons.add_outlined),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '30 000 000đ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        children: [
                                          OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.blue, // background
                                              side: const BorderSide(
                                                  color: Colors.white),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: const Text(
                                              "Xóa",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      //het 1 san pham
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/products/2.png',
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                        "Macbook Air 2020 M1 8GPU 16GB 512GB Z1250004D - Grey"),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            padding: const EdgeInsets.only(
                                                bottom: 12),
                                            iconSize: 18,
                                            onPressed: () {},
                                            icon: const Icon(Icons.minimize),
                                          ),
                                          //const SizedBox(width: 5),
                                          Text(
                                            '1',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                          //const SizedBox(width: 5),
                                          IconButton(
                                            iconSize: 18,
                                            onPressed: () {},
                                            icon:
                                                const Icon(Icons.add_outlined),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '30 000 000đ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        children: [
                                          OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.blue, // background
                                              side: const BorderSide(
                                                  color: Colors.white),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: const Text(
                                              "Xóa",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
//danh sach san pham
                const Divider(
                  height: 20,
                  thickness: 10,
                  indent: 8,
                  endIndent: 10,
                  color: Colors.black12,
                ),
//mục hiện giá tiền và khuyễn mãi
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 20.0, top: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 220,
                              height: 50,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Mã Khuyễn Mãi',
                                ),
                              ),
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Áp Dụng",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tổng giá trị sản phẩm:",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "52 990 990đ",
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tạm tính:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "52 990 990đ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //het mục hiện giá tiền và khuyễn mãi
                const Divider(
                  height: 20,
                  thickness: 10,
                  indent: 8,
                  endIndent: 10,
                  color: Colors.black12,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 20.0, top: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("THÔNG TIN KHÁCH HÀNG"),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Họ tên',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Số điện thoại',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      //check radio
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //check giao tan noi
                          Row(
                            children: [
                              Radio<GiaoNhan>(
                                value: GiaoNhan.giaotannoi,
                                groupValue: _character,
                                onChanged: (GiaoNhan? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                              const Text("Giao tận nơi")
                            ],
                          ),
                          //check nhan tai cua hang
                          Row(
                            children: [
                              Radio(
                                value: GiaoNhan.nhantaicuahang,
                                groupValue: _character,
                                onChanged: (GiaoNhan? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                              const Text("Nhận tại cửa hàng")
                            ],
                          ),
                        ],
                      ),
                      //dia chi
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 150,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Tỉnh/Thành Phố',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 150,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Quận/Huyện',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //dong 2
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 150,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Phường/Xã',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 150,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Địa chỉ',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //ghi chú
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 300,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Ghi chú đơn hàng(nếu có)',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      //phương thức thanh toán
                      const Divider(
                        height: 20,
                        thickness: 5,
                        indent: 8,
                        endIndent: 10,
                        color: Colors.black12,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("PHƯƠNG THỨC THANH TOÁN"),
                            ],
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
                      const Divider(
                        height: 20,
                        thickness: 5,
                        indent: 8,
                        endIndent: 10,
                        color: Colors.black12,
                      ),
                      Container(
                        child: RichText(
                          text: TextSpan(
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
                                  text: ' Chính sách bảo mật thông tin cá nhân',
                                  style: TextStyle(color: Colors.blue)),
                              TextSpan(
                                text: ' của KHKmart.com.vn)',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        height: 20,
                        thickness: 5,
                        indent: 8,
                        endIndent: 10,
                        color: Colors.black12,
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
                                "52 990 000 đ",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(280, 48),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Đặt mua',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
