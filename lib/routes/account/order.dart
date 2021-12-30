import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'order_detail.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Đơn hàng'),
            centerTitle: true,
            bottom: const TabBar(
              // labelColor: Colors.blue,

              tabs: [
                Tab(
                  child: Text(
                    'Đơn hàng',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Đã hủy',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
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
                            alignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.local_shipping,
                                    color: Colors.green,
                                    size: 17,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Đã giao hàng',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.green,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: const Text('Đánh giá'),
                                  ),
                                  const SizedBox(width: 7),
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
                    ),
                    Card(
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
                            alignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.local_shipping,
                                    color: Colors.green,
                                    size: 17,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Đã giao hàng',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.green,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Perform some action
                                    },
                                    child: const Text('Đánh giá'),
                                  ),
                                  const SizedBox(width: 7),
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
                    ),
                  ],
                ),
              ),
              Tab(
                child: ListView(
                  children: [
                    Card(
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
                            alignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.warning_amber_rounded,
                                    color: Colors.red,
                                    size: 17,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Đã hủy',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.red,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
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
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
