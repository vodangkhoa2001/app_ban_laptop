// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

enum GiaoNhan { nhantaicuahang, giaotannoi }
enum ThanhToan { thanhtoanbangtien }

class _PaymentState extends State<Payment> {
  GiaoNhan? _character = GiaoNhan.giaotannoi;
  ThanhToan? _thanhtoan = ThanhToan.thanhtoanbangtien;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: const Text(
                      'ASUS 15.6" Republic of Gamers StrixG15 Series Gaming Laptop'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('SL: 1'),
                      Text('21.000.000',
                          style: TextStyle(color: Colors.red[400])),
                    ],
                  ),
                  leading: Image.asset('assets/images/products/1.png'),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                      'Macbook Air 2020 M1 8GPU 16GB 512GB Z1250004D - Grey'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('SL: 1'),
                      Text('31.990.000',
                          style: TextStyle(color: Colors.red[400])),
                    ],
                  ),
                  leading: Image.asset('assets/images/products/2.png'),
                ),
              ),

              //mục hiện giá tiền và khuyễn mãi
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'Nhập mã giảm giá',
                            ),
                          ),
                        ),
                        Positioned(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(90, 48),
                              primary: Colors.blue,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                            ),
                            onPressed: () => print('Chưa nhập mã'),
                            child: const Text('Áp dụng'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Tổng giá trị sản phẩm:",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "52.990.990đ",
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Tạm tính:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "52.990.990đ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //het mục hiện giá tiền và khuyễn mãi

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text("THÔNG TIN KHÁCH HÀNG"),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      child: const TextField(
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
                      child: const TextField(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 192,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Tỉnh/Thành Phố',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 40,
                                  width: 192,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Quận/Huyện',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //dong 2
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 192,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Phường/Xã',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 40,
                                  width: 192,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Địa chỉ',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //ghi chú
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 390,
                                  child: const TextField(
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
                    const SizedBox(
                      height: 15,
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
                              fontWeight: FontWeight.w400, color: Colors.grey),
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
                                text: ' Chính sách bảo mật thông tin cá nhân',
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
                          children: const [
                            Text(
                              "Thành Tiền",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "52.990.000 đ",
                              style: TextStyle(
                                color: Colors.red,
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

          //danh sach san pham
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child:

          //  )
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        child: MaterialButton(
          onPressed: () {},
          color: Colors.blue,
          height: 50,
          minWidth: 100,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(15),
          // ),
          child: const Text(
            "Thanh toán",
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
