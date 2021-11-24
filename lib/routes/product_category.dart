import 'package:flutter/material.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({ Key? key }) : super(key: key);

  @override
  _ProductCategoryState createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue[500]
      ),
      body:Container(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[500],
        type: BottomNavigationBarType.fixed,
        items:const [
        BottomNavigationBarItem(icon: Icon(Icons.menu),
          label: 'Danh mục',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.paid),
          label: 'Khuyến mãi',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_basket),
          label: 'Giỏ hàng',
        ),
      ],),
    );
  }
}