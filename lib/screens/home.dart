import 'package:ban_laptop/models/product/product.dart';
import 'package:ban_laptop/models/product/product1.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:provider/provider.dart';
import '../routes/product/provider/product_provider.dart';
import '../base_url.dart';
import 'home/components/product_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // late final ProductDemo product;
  List<Product> products = [];

  int activeIndex = 0;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Trang chủ');

  @override
  void initState() {
    super.initState();
    final products = Provider.of<ProductProvider>(context, listen: false);
    products.getProduct(context);
  }

  get child => null;
  //Tạo nút tròn khi chuyển banner
  // sài smooth page indicator trên pub.dev
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 5, //image.length lấy độ dài của ảnh
        effect: const SwapEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Colors.blue,
          dotColor: Colors.grey,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  //Children của ListView là các ListTiles. ListTile là một widget được build sẵn để thể hiện Một title trong ListView cơ bản gồm các subtitle, icons, image.
                  customSearchBar = const ListTile(
                    //leading là một Widget được đặt phía trước vùng title, thông thường nó là một Icon hoặc IconButton.
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      cursorColor: Colors.red,
                      // cursorRadius: Radius.circular(16.0),
                      // cursorWidth: 16.0,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Nhập sản phẩm cần tìm ...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                        //border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text('Trang chủ');
                }
              });
            },
            icon: customIcon,
          )
        ],
        centerTitle: true, //căn giữa tiêu đề
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Icon(
                  Icons.home,
                  size: 20,
                ),
                Positioned(
                  left: -20,
                  child: Text("Khu vực của bạn: Lý Chính Thắng, Q3, TPHCM"),
                ),
                //Text("Khu vực của bạn: Lý Chính Thắng, Q3, TPHCM"),
                Icon(
                  Icons.expand_more,
                  size: 20,
                ),
                //IconButton(
                //   icon: Icon(Icons.expand_more),
                //   tooltip: 'Thay đổi khu vực',
                //onPressed: () {setState(() {});},
                // ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              //autofocus: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 0), //Chỉnh độ rộng textFiled
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                labelText: "Nhập sản phẩm cần tìm ...",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: 210,
                  viewportFraction: 1, //Hiển thị trên giao diện 1 ảnh
                  autoPlay: true,
                  enlargeCenterPage: true,
                  //enlargeStrategy: CenterPageEnlargeStrategy.height,
                  //pageSnapping: false,//Cho phép xem 2 cái 1 lần
                  //enableInfiniteScroll: false,//Không scroll lặp lại
                  //reverse: true, // chạy ngược lại
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
                itemCount: 5,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    //Sài thêm 1 cái child ClipRRect để bo tròn ảnh
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/banners/banner01.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: buildIndicator(),
            ),
            const SizedBox(
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Sản phẩm nổi bật",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      )),
                  GestureDetector(
                    onTap: () {},
                    child: const Text("Tất cả"),
                  )
                ],
              ),
            ),
            const SizedBox(
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Consumer<ProductProvider>(
                builder: (context, data, child) {
                  return Row(
                    children: data.products
                        .map((item) => InkWell(
                              onTap: () {},
                              child: ProductCard(product: item),
                            ))
                        .toList(),
                  );
                },
              ),
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: <Widget>[
            //     // const SizedBox(
            //     //   height: 10,
            //     // ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 10, right: 10),
            //       child: Column(
            //         //được sử dụng để chỉ định cách mà các widget con sẽ được bố trí trên trục chính(ở đây là trục dọc)
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           // const SizedBox(
            //           //   height: 3,
            //           // ),
            //           // Row(
            //           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           //   children: const <Widget>[
            //           //     Icon(
            //           //       Icons.home,
            //           //       size: 20,
            //           //     ),
            //           //     Positioned(
            //           //       left: -20,
            //           //       child: Text(
            //           //           "Khu vực của bạn: Lý Chính Thắng, Q3, TPHCM"),
            //           //     ),
            //           //     //Text("Khu vực của bạn: Lý Chính Thắng, Q3, TPHCM"),
            //           //     Icon(
            //           //       Icons.expand_more,
            //           //       size: 20,
            //           //     ),
            //           //     //IconButton(
            //           //     //   icon: Icon(Icons.expand_more),
            //           //     //   tooltip: 'Thay đổi khu vực',
            //           //     //onPressed: () {setState(() {});},
            //           //     // ),
            //           //   ],
            //           // ),
            //           // const SizedBox(
            //           //   height: 5,
            //           // ),
            //           // TextField(
            //           //   //autofocus: true,
            //           //   decoration: InputDecoration(
            //           //     contentPadding: const EdgeInsets.symmetric(
            //           //         vertical: 0), //Chỉnh độ rộng textFiled
            //           //     prefixIcon: const Icon(Icons.search),
            //           //     filled: true,
            //           //     fillColor: Colors.white,
            //           //     border: OutlineInputBorder(
            //           //       borderRadius: BorderRadius.circular(15.0),
            //           //     ),
            //           //     labelText: "Nhập sản phẩm cần tìm ...",
            //           //   ),
            //           // ),
            //           // const SizedBox(
            //           //   height: 10,
            //           // ),
            //           //Expanded là một widget giúp mở rộng không gian cho một widget con của Row hoặc Column theo trục chính (main axis).
            //           // Center(
            //           //   child: CarouselSlider.builder(
            //           //     options: CarouselOptions(
            //           //       height: 210,
            //           //       viewportFraction: 1, //Hiển thị trên giao diện 1 ảnh
            //           //       autoPlay: true,
            //           //       enlargeCenterPage: true,
            //           //       //enlargeStrategy: CenterPageEnlargeStrategy.height,
            //           //       //pageSnapping: false,//Cho phép xem 2 cái 1 lần
            //           //       //enableInfiniteScroll: false,//Không scroll lặp lại
            //           //       //reverse: true, // chạy ngược lại
            //           //       autoPlayInterval: const Duration(seconds: 3),
            //           //       onPageChanged: (index, reason) {
            //           //         setState(() {
            //           //           activeIndex = index;
            //           //         });
            //           //       },
            //           //     ),
            //           //     itemCount: 5,
            //           //     itemBuilder: (context, index, realIndex) {
            //           //       return Container(
            //           //         margin: const EdgeInsets.symmetric(horizontal: 10),
            //           //         //Sài thêm 1 cái child ClipRRect để bo tròn ảnh
            //           //         child: ClipRRect(
            //           //           borderRadius: BorderRadius.circular(20),
            //           //           child: Image.asset(
            //           //             'assets/images/banners/banner01.jpg',
            //           //             fit: BoxFit.cover,
            //           //           ),
            //           //         ),
            //           //       );
            //           //     },
            //           //   ),
            //           // ),
            //           // const SizedBox(
            //           //   height: 5,
            //           // ),
            //           // Center(
            //           //   child: buildIndicator(),
            //           // ),
            //           // const SizedBox(
            //           //   child: Divider(
            //           //     thickness: 1,
            //           //     color: Colors.black,
            //           //   ),
            //           // ),
            //           // Container(
            //           //   padding: const EdgeInsets.only(top: 5),
            //           //   child: Row(
            //           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           //     children: [
            //           //       const Text("Sản phẩm nổi bật",
            //           //           style: TextStyle(
            //           //             fontSize: 20,
            //           //             color: Colors.black,
            //           //           )),
            //           //       GestureDetector(
            //           //         onTap: () {},
            //           //         child: const Text("Tất cả"),
            //           //       )
            //           //     ],
            //           //   ),
            //           // ),
            //           // const SizedBox(
            //           //   child: Divider(
            //           //     thickness: 1,
            //           //     color: Colors.black,
            //           //   ),
            //           // ),
            //           // SingleChildScrollView(
            //           //   scrollDirection: Axis.horizontal,
            //           //   child: Consumer<ProductProvider>(
            //           //     builder: (context, data, child) {
            //           //       return Row(
            //           //         children: data.products
            //           //             .map((item) => InkWell(
            //           //                   onTap: () {},
            //           //                   child: ProductCard(product: item),
            //           //                 ))
            //           //             .toList(),
            //           //       );
            //           //     },
            //           //   ),
            //           // ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
