// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:ban_laptop/models/invoice/invoice.dart';
import 'package:ban_laptop/screens/loading.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'order_detail.dart';

// import 'package:ban_laptop/models/product/product.dart';
final storage = new FlutterSecureStorage();

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> with SingleTickerProviderStateMixin {
  List<Invoice> lstInvoice = [];
  TabController? tabController;
  String? id;
  getId() async {
    setState(() {});
    id = await storage.read(key: "id");
  }

  _loadInvoice() async {
    final data = await CallApi.getAllInvoiceByUser(id);
    setState(() {
      lstInvoice = data;
    });
  }

  _loadStatus() {
    setState(() {
      tabController = TabController(length: status.length, vsync: this);
      tabController!.addListener((_handleTabSelection));
    });
  }

  _handleTabSelection() {
    setState(() {});
  }

  bool check = true;

  void _loading() {
    if (id == null) {
      Future.delayed(Duration(seconds: 1), _loading);
    } else {
      check = false;
      _loadInvoice();
    }
  }

  @override
  void initState() {
    super.initState();
    getId();
    _loadStatus();
    _loading();
  }

  var fontSize = 12.0;
  var height = 120.0;
  List status = [
    'Đã hủy',
    'Chờ xác nhận',
    'Chờ vận chuyển',
    'Đang giao',
    'Chưa đánh giá',
  ];

  final f = new NumberFormat("#,##0", "vi_VN");

  Widget invoice(int i) {
    return ListView.builder(
      itemCount: lstInvoice.length,
      itemBuilder: (context, index) => lstInvoice[index].trangThoaiHoaDon == i
          ? InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    child: OrderDetail(
                      status: status[i],
                      invoice: lstInvoice[index],
                    ),
                  ),
                );
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
                        lstInvoice[index].hinhAnh.toString(),
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
                              lstInvoice[index].tenSanPham.toString(),
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
                                    f.format(lstInvoice[index].tongTien) +
                                        ' VND',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                Text('SL: '+ lstInvoice[index].soLuong.toString())
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
          : Padding(padding: EdgeInsets.zero),
    );
  }

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
            controller: tabController,
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
        body: 
       check?Loading(): TabBarView(
          controller: tabController,
          children: [
            invoice(1),
            invoice(2),
            invoice(3),
            invoice(4),
            invoice(0),
          ],
        ),
      ),
    );
  }
}
