import 'package:flutter/material.dart';
//screens
import 'routes/shopping/category_screen.dart';
import 'routes/shopping/discount_screen.dart';
import 'routes/shopping/shoppingbag_screen.dart';

class Shopping extends StatefulWidget {
  const Shopping({Key? key}) : super(key: key);

  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  static const primaryColor = Color(0xFF4478DE);

  int currentTab = 0;
  final List<Widget> screens = [
    const Category(),
    const Discount(),
    const ShoppingBag()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Category();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true ,
          title: const Text('Mua hàng'),
        ),
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    //danh mục
                    MaterialButton(
                      minWidth: 30,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Category();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.menu,color: currentTab == 0 ? primaryColor : Colors.grey,), 
                        Text('Danh mục',style: TextStyle(color: currentTab == 0 ? primaryColor : Colors.grey,),)],
                      ),
                    ),
                    //khuyến mãi
                    MaterialButton(
                      minWidth: 30,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Discount();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_offer,color: currentTab == 1 ? primaryColor : Colors.grey,),
                          Text('Khuyến mãi',style: TextStyle(color: currentTab == 1 ? primaryColor : Colors.grey,),)
                        ],
                      ),
                    ),
                    //giỏ hàng
                    MaterialButton(
                      minWidth: 30,
                      onPressed: () {
                        setState(() {
                          currentScreen = const ShoppingBag();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_bag_outlined,color: currentTab == 2 ? primaryColor : Colors.grey,),
                          Text('Giỏ hàng',style:TextStyle(color: currentTab == 2 ? primaryColor : Colors.grey,))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
