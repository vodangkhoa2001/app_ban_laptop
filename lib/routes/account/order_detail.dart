// ignore_for_file: deprecated_member_use, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class OrderDetail extends StatefulWidget {
  OrderDetail({Key? key, required this.status}) : super(key: key);
  String status;
  @override
  _OrderDetailState createState() => _OrderDetailState(status);
}

class _OrderDetailState extends State<OrderDetail> {
  final String status;
  _OrderDetailState(this.status);
  static const colorComplete = Color(0xFF26AA99);
  // static const colorDisable = Color(0xFF7B7B7B);
  double borderRadius = 30;
  double fontSizeSmall = 10;
  double sizeIcon = 30;
  double widthLine = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết đơn hàng'),
      ),
      body: ListView(
        children: [
          Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xFFCCCCCC)),
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    status,
                    style: TextStyle(color: (status != 'Đã hủy')?Colors.green[500]:Colors.red[500]),
                  ),
                  Text('ID Đơn hàng: 210612574G7G8S'),
                ],
              )),
          // Column(
          //   children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Thông tin nhận hàng',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Số điện thoại: 0329290298'),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      'Địa chỉ: ấp Gò Nổi, xã Ninh Điền, huyện Châu Thành, tỉnh Tây Ninh'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Image.asset(
                  'assets/images/products/macOs.jpg',
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                flex: 6,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          children: [
                            const Text(
                              'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'SL: 1',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text(
                                    '20.000.000',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.red),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
          //bảng
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Table(
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: const <TableRow>[
                TableRow(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Tổng tiền hàng',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('20.000.000',
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  ),
                ]),
                TableRow(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Phí vận chuyển',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('0',
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  ),
                ]),
                TableRow(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Tổng tiền',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('20.000.000',
                        style: TextStyle(
                          color: Colors.red,
                        )),
                  ),
                ]),
                TableRow(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Phương thức thanh toán',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Trả tiền khi nhận hàng',
                    ),
                  ),
                ])
              ],
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
      
      bottomSheet: Table(
        border: const TableBorder(top: BorderSide(color: Colors.blue)),
        children: [
          (status != 'Chưa đánh giá')?
          TableRow(
            children: [
               FlatButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        'Mua lại',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )))
            ],
          ):
          TableRow(
            children: [
              FlatButton(
                  onPressed: () {},
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        'Đánh giá',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ))),
                       FlatButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      child: const Text(
                        'Mua lại',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))),
            ]
          ),
        ],
      ),
    );
  }
}
