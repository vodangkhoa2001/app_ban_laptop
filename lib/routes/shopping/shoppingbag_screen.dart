import 'package:flutter/material.dart';
class ShoppingBag extends StatefulWidget {
  const ShoppingBag({ Key? key }) : super(key: key);

  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true ,
        automaticallyImplyLeading: false,
        title: const Text('Giỏ hàng'),),
      body: const Center(child: Text('Giỏ hàng'),),
    );
  }
}