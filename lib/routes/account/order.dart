// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'order_detail.dart';
// import 'package:ban_laptop/models/product/product.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  var fontSize = 12.0;
  var height = 120.0;
  List status = [
    'Đã hủy', 
    'Đã xác nhận',
    'Chờ vận chuyển',
    'Đang giao',
    'Chưa đánh giá',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Đơn hàng'),
            centerTitle: true,
            bottom: TabBar(
              // labelColor: Colors.blue,

              tabs: [
                Tab(
                  child: Text(status[1],
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      textAlign: TextAlign.center),
                ),
                Tab(
                  child: Text(status[2],
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      textAlign: TextAlign.center),
                ),
                Tab(
                  child: Text(status[3],
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      textAlign: TextAlign.center),
                ),
                Tab(
                  child: Text(status[4],
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      textAlign: TextAlign.center),
                ),
                Tab(
                  child: Text(status[0],
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      textAlign: TextAlign.center),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Tab(
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: OrderDetail(status: status[1],)));
                      },
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 80,
                              height: 90,
                              child: Image.asset(
                                'assets/images/products/macOs.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.only(left: 15),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB',
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
                                            '2.000.000.000',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Text('SL: 1'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: OrderDetail(status: status[1],)));
                      },
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 80,
                              height: 90,
                              child: Image.asset(
                                'assets/images/products/macOs.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.only(left: 15),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB',
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
                                            '2.000.000.000',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Text('SL: 1'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: OrderDetail(status: status[2],)));
                      },
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 80,
                              height: 90,
                              child: Image.asset(
                                'assets/images/products/macOs.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.only(left: 15),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB',
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
                                            '2.000.000.000',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Text('SL: 1'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: OrderDetail(status: status[3],)));
                      },
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 80,
                              height: 90,
                              child: Image.asset(
                                'assets/images/products/macOs.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.only(left: 15),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB',
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
                                            '2.000.000.000',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Text('SL: 1'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )]
                ),
              ),
              Tab(
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: OrderDetail(status: status[4],)));
                      },
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 80,
                              height: 90,
                              child: Image.asset(
                                'assets/images/products/macOs.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.only(left: 15),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB',
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
                                            '2.000.000.000',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Text('SL: 1'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: OrderDetail(status: status[0],)));
                      },
                      child: Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 80,
                              height: 90,
                              child: Image.asset(
                                'assets/images/products/macOs.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              // padding: EdgeInsets.only(left: 15),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text(
                                      'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB',
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
                                            '2.000.000.000',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        Text('SL: 1'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
