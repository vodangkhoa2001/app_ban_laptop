import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'order_detail.dart';
import 'package:ban_laptop/models/product/product.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  var fontSize = 12.0;
  var height = 150.0;
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
                  child: Text('Đã xác nhận',
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      textAlign: TextAlign.center),
                ),
                Tab(
                  child: Text('Chờ vận chuyển',
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      textAlign: TextAlign.center),
                ),
                Tab(
                  child: Text('Đang giao',
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      textAlign: TextAlign.center),
                ),
                Tab(
                  child: Text('Chưa đánh giá',
                      style: TextStyle(
                        fontSize: fontSize,
                      ),
                      textAlign: TextAlign.center),
                ),
                Tab(
                  child: Text('Đã hủy',
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
                    Card(
                        child: Container(
                      height: height,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB'),
                            leading: Image.asset(
                              'assets/images/products/macOs.jpg',
                              width: 80, 
                              fit: BoxFit.cover,
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('SL: 1'),
                                Text(
                                  '20.000.000',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            minLeadingWidth: 50,
                            contentPadding: const EdgeInsets.only(right: 15),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: const OrderDetail()));
                            },
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: const Text('Hủy'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                    Card(
                        child: Container(
                      height: height,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                                'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB'),
                            leading: Image.asset(
                              'assets/images/products/macOs.jpg',
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('SL: 1'),
                                Text(
                                  '20.000.000',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            minLeadingWidth: 50,
                            contentPadding: const EdgeInsets.only(right: 15),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: const OrderDetail()));
                            },
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: const Text('Hủy'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              Tab(
                child: ListView(
                  children: [
                    Card(
                        child: Container(
                      height: height,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                                'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB'),
                            leading: Image.asset(
                              'assets/images/products/macOs.jpg',
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('SL: 1'),
                                Text(
                                  '20.000.000',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            minLeadingWidth: 50,
                            contentPadding: const EdgeInsets.only(right: 15),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: const OrderDetail()));
                            },
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              Tab(
                child: ListView(
                  children: [
                    Card(
                        child: Container(
                      height: height,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                                'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB'),
                            leading: Image.asset(
                              'assets/images/products/macOs.jpg',
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('SL: 1'),
                                Text(
                                  '20.000.000',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            minLeadingWidth: 50,
                            contentPadding: const EdgeInsets.only(right: 15),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: const OrderDetail()));
                            },
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              Tab(
                child: ListView(
                  children: [
                    Card(
                        child: Container(
                      height: height,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                                'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB'),
                            leading: Image.asset(
                              'assets/images/products/macOs.jpg',
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('SL: 1'),
                                Text(
                                  '20.000.000',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            minLeadingWidth: 50,
                            contentPadding: const EdgeInsets.only(right: 15),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: const OrderDetail()));
                            },
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: const Text('Đánh giá'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              Tab(
                child: ListView(
                  children: [
                    Card(
                        child: Container(
                      height: height,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                                'MacBook Pro 16" 2019 Touch Bar 2.3GHz Core i9 1TB'),
                            leading: Image.asset(
                              'assets/images/products/macOs.jpg',
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('SL: 1'),
                                Text(
                                  '20.000.000',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            minLeadingWidth: 50,
                            contentPadding: const EdgeInsets.only(right: 15),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: const OrderDetail()));
                            },
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: const Text('Mua lại'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
