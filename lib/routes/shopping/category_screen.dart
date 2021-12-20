// import 'dart:convert';

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//product
// import 'package:ban_laptop/model/product/product.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  //static const primaryColor = Color(0xFF4478DE);
  int currentTab = 0;
  List<String> list = ['MacOs', 'Dell', 'Asus', 'Lenovo', 'HP', 'Acer', 'MSI'];
  List<String> lstProduct = [
    'MacOs',
    'Dell',
    'Asus',
    'Lenovo',
    'HP',
    'Acer',
    'MSI'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: list.length,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text('Danh mục'),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                for (var i in list)
                  Tab(
                    text: i,
                  ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              for (var i in lstProduct)
                Column(
                  children: [
                    //Text(i),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 0.67,
                          ),
                          itemCount: 4,
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
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Image.asset(
                                          'assets/images/products/macOs.jpg',
                                          fit: BoxFit.cover,
                                          height: 170,
                                        ),
                                        top: 10,
                                      ),
                                      Positioned(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 10, bottom: 35),
                                          decoration: const BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(14),
                                                  bottomRight:
                                                      Radius.circular(14))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Ten san pham',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                '20.000.000 VND',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                      )
                                    ],
                                  ),
                                )),
                              ],
                            );
                          }),
                    )),
                  ],
                )
            ],
          )

          // Stack(
          //   children: [
          //     PageStorage(
          //       child: currentScreen,
          //       bucket: bucket,
          //     ),

          //   ],
          // )
          ),
      // bottomNavigationBar: BottomAppBar(
      //   child: SizedBox(
      //     height: 200,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Column(
      //           children: [
      //             //danh mục
      //             MaterialButton(
      //               minWidth: 30,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen = const Product1();
      //                   currentTab = 0;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [Icon(Icons.menu,color: currentTab == 0 ? primaryColor : Colors.grey,),
      //                 Text('Danh mục',style: TextStyle(color: currentTab == 0 ? primaryColor : Colors.grey,),)],
      //               ),
      //             ),
      //             //khuyến mãi
      //             MaterialButton(
      //               minWidth: 30,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen = const Product2();
      //                   currentTab = 1;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(Icons.local_offer,color: currentTab == 1 ? primaryColor : Colors.grey,),
      //                   Text('Khuyến mãi',style: TextStyle(color: currentTab == 1 ? primaryColor : Colors.grey,),)
      //                 ],
      //               ),
      //             ),
      //             //giỏ hàng
      //             MaterialButton(
      //               minWidth: 30,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen = const Product3();
      //                   currentTab = 2;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(Icons.shopping_bag_outlined,color: currentTab == 2 ? primaryColor : Colors.grey,),
      //                   Text('Giỏ hàng',style:TextStyle(color: currentTab == 2 ? primaryColor : Colors.grey,))
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               minWidth: 30,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen = const Product4();
      //                   currentTab = 2;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(Icons.shopping_bag_outlined,color: currentTab == 2 ? primaryColor : Colors.grey,),
      //                   Text('Giỏ hàng',style:TextStyle(color: currentTab == 2 ? primaryColor : Colors.grey,))
      //                 ],
      //               ),
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // )
    );
  }
}
