import 'package:flutter/material.dart';

class Discount extends StatefulWidget {
  const Discount({ Key? key }) : super(key: key);

  @override
  _DiscountState createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: const Text('Khuyến mãi'),
        automaticallyImplyLeading: false,
      ),
        
      body: const Center(child: Text('Khuyến mãi'),),
    );
  }
}