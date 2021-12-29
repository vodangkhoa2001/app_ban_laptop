// ignore: file_names
import 'package:ban_laptop/routes/shopping/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chi tiết sản phẩm'),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    child: const Category(),
                  ),
                );
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Text(
                  "Tổng quan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  "Mô tả",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  "Chi tiết",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  "Đánh giá",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250,
                      child: AspectRatio(
                        aspectRatio: 1.02,
                        child: Image.asset('assets/images/products/macOs.jpg'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          4,
                          (index) => buildSmallPreview(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ListView(
              children: const [
                Text(
                  'Đây là mô tả sản phẩm',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            ListView(
              children: const [
                Text(
                  'Đây là chi tiết sản phẩm',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            ListView(
              children: const [
                Text(
                  'Đây là đánh giá sản phẩm',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildSmallPreview() {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.all(3),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red),
      ),
      child: Image.asset('assets/images/products/macOs.jpg'),
    );
  }
}
