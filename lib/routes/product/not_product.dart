// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
class NotProduct extends StatefulWidget {
  const NotProduct({ Key? key }) : super(key: key);

  @override
  State<NotProduct> createState() => _NotProductState();
}

class _NotProductState extends State<NotProduct> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(Icons.find_in_page_rounded,size:100,color: Colors.grey,),
        SizedBox(height:10),
        Text('Chưa có sản phẩm nào!'),
      ],)
    );
  }
}