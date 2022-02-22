// ignore_for_file: unnecessary_new, prefer_const_constructors

// import 'dart:math';
import 'dart:convert';
import 'dart:ui';

import 'package:ban_laptop/models/product/product.dart';
import 'package:ban_laptop/models/product/product_info.dart';
import 'package:ban_laptop/models/product/product_type.dart';
import 'package:ban_laptop/screens/loading.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import 'product_detail.dart';
//product
// import 'package:ban_laptop/model/product/product.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  _CategoryState({this.tabController});
  List<List<Product>> lstproduct = [];
  List<ProductType> lstProductType = [];
  

  _loadListProductByType(int id) async {
    for (var i = 1; i <= lstProductType.length; i++) {
      final data = await CallApi.getAllProfuctByType(i);
      setState(() {
        lstproduct.add(data);
      });
    }
    stop();
  }

  _loadListProductType() async {
    final data = await CallApi.getAllProfuctType();
    setState(() {
      lstProductType = data;

      tabController = TabController(length: lstProductType.length, vsync: this);
      tabController!.addListener((_handleTabSelection));

      if (lstProductType.length > 0) {
        _loadListProductByType(0);
      }
    });
  }

  bool check = true;

  void _handleTabSelection() {
    setState(() {
      // check = true;
      loading();
      // _loadListProductByType(tabController!.index + 1);
    });
  }

  void loading() {
    Future.delayed(Duration(seconds: 0), loading);
  }

  void stop() {
    setState(() {
      check = false;
    });
  }

  @override
  void initState() {
    super.initState();
      // loading();
    setState(() {
      _loadListProductType();
    });
  }

  var starPoint = 5;
  TextEditingController search = new TextEditingController();

  final f = new NumberFormat("#,##0", "vi_VN");

  Widget tab(int i) {
    return Column(
      children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 0.67,
              ),
              itemCount: lstproduct[i].length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.blue)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    child: Details(product: lstproduct[i][index],)));
                          },
                          child: Stack(
                            children: [
                              Positioned(
                                child: Image.network(
                                  lstproduct[i][index].HinhAnh,
                                  fit: BoxFit.cover,
                                  height: 170,
                                ),
                                top: 10,
                                left: 5,
                                right: 5,
                              ),
                              Positioned(
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 15, 10),
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(14),
                                          bottomRight: Radius.circular(14))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        lstproduct[i][index].TenSanPham.length <
                                                40
                                            ? lstproduct[i][index].TenSanPham
                                            : lstproduct[i][index]
                                                    .TenSanPham
                                                    .substring(0, 38) +
                                                "...",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        f.format(lstproduct[i][index].GiaBan) +
                                            'VND',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          decoration: TextDecoration.lineThrough
                                        ),
                                      ),
                                      Text(
                                        f.format(lstproduct[i][index].GiaNhap) +
                                            'VND',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              for (var i = 1; i < 6; i++)
                                                (i <= starPoint)
                                                    ? const Icon(
                                                        Icons.star_rounded,
                                                        size: 20,
                                                        color: Colors.white)
                                                    : const Icon(
                                                        Icons
                                                            .star_border_rounded,
                                                        size: 20,
                                                        color: Colors.white),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: (){},
                                            child: Icon(Icons.shopping_cart_rounded,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                bottom: 0,
                                left: 0,
                                right: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return check
                      ? Loading()
                      : DefaultTabController(
            length: lstProductType.length,
            child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: const Text('Danh mục'),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  bottom: TabBar(
                    controller: tabController,
                    isScrollable: true,
                    tabs: [
                      for (var i = 0; i < lstProductType.length; i++)
                        Tab(
                          text: lstProductType[i].tenDongSanPham,
                        ),
                    ],
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.blue[200],
                  ),
                ),
                body: TabBarView(
                  controller: tabController,
                  children: [
                    for (var i = 0; i < lstProductType.length; i++) 
                    tab(i),
                  ],
                )
                ),
           );
  }
}
