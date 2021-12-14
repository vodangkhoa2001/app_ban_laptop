// import 'dart:convert';

import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Danh mục'),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'Dell',
                ),
                Tab(
                  text: 'Asus',
                ),
                Tab(
                  text: 'Lenovo',
                ),
                Tab(
                  text: 'MacOs',
                ),
              ],
            ),
          ),
          body:const TabBarView(
            children: <Widget> [
              
              Text('sp1'),
              Text('sp2'),
              Text('sp3'),
              Text('sp4'),
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
