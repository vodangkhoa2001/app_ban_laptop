import 'dart:async';
import 'package:ban_laptop/routes/shopping/shoppingbag_screen.dart';
import 'routes/login_signup/login_signup.dart';
import 'account.dart';
import 'chat.dart';
import 'home.dart';
import 'shopping.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shop KHK mart',
      home: LoadingScreen(),
      //home: ShoppingBag(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const Login_SignUp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Image.asset(
              'assets/images/logo.png',
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const primaryColor = Color(0xFF4478DE);
  int currentTab = 0;
  final List<Widget> screens = [
    const Dashboard(),
    const Shopping(),
    const Chat(),
    const Account()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        bottomNavigationBar: BottomAppBar(
            child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //trang chủ
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.house,
                          color: currentTab == 0 ? primaryColor : Colors.grey,
                        ),
                        Text(
                          'Trang chủ',
                          style: TextStyle(
                              color:
                                  currentTab == 0 ? primaryColor : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  //mua hàng
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Shopping();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: currentTab == 1 ? primaryColor : Colors.grey,
                        ),
                        Text(
                          'Mua Hàng',
                          style: TextStyle(
                              color:
                                  currentTab == 1 ? primaryColor : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  //tư vấn
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Chat();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_sharp,
                          color: currentTab == 2 ? primaryColor : Colors.grey,
                        ),
                        Text(
                          'Tư vấn',
                          style: TextStyle(
                              color:
                                  currentTab == 2 ? primaryColor : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  //tài khoản
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Account();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 3 ? primaryColor : Colors.grey,
                        ),
                        Text(
                          'Tài khoản',
                          style: TextStyle(
                              color:
                                  currentTab == 3 ? primaryColor : Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )));
  }
}
