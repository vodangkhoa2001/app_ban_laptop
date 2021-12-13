import 'package:flutter/material.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mua hàng'),
        ),
        body: const Center(
          child: Text(
            'Mua hàng',
            style: TextStyle(fontSize: 40),
          ),
        ));
  }
}
