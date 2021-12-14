import 'package:flutter/material.dart';
class Order extends StatefulWidget {
  const Order({ Key? key }) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn hàng'),
        centerTitle:true,
      ),
      body: ListView(
        children: [
          Card(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(children: [Image.asset('assets/images/products/macOs.jpg',
            width:100,
            fit: BoxFit.cover,
          )]
          ),
          Column(children: [Text('Sản phẩm 1')]),
          Column(children: [
            ElevatedButton(onPressed: (){}, child: Text('Mua lại')),
            ElevatedButton(onPressed: (){}, child: Text('Hủy'))
          ],),
        ],
        ),),
        ],
      )
    );
  }
}