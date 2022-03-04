// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:ban_laptop/models/product/product.dart';
import 'package:ban_laptop/routes/product/product_detail.dart';
import 'package:ban_laptop/screens/home/components/total_product.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final f = new NumberFormat("#,##0", "vi_VN");
  // late final ProductDemo product;
  List<Product> lstproduct = [];
  var product = 2;
   final storage = FlutterSecureStorage();
  String? id;

  int activeIndex = 0;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Trang chủ');

  void loadAllProduct() async {
    List<Product> products = await CallApi.getAllProducts();
    setState(() {
      lstproduct = products;
    });
  }

  bool _loading = false;
  void onLoading() {
    setState(() {
      if (lstproduct.length == 0) {
        _loading = true;
        Future.delayed(Duration(seconds: 1), onLoading);
      } else {
        _loading = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadAllProduct();
    onLoading();
  }

  get child => null;

  List<String> banners = [
    "Mới",
    "Khuyến mãi",
    ""
  ];
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

  Widget card(int i,String status) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(product: lstproduct[i],banner: status,)));
        },
        child: 
        Card(
            child: Container(
                width: 200.0,
                height: 100.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                        
                child: Stack(
                  children: [
                    Container(
                      width: 250,
                      height: 110,
                      padding: EdgeInsets.only(top: 15),
                      child: Image.network('${lstproduct[i].hinhAnh}'),
                    ),
                    Container(
                      // alignment: Alignment.center,
                      padding: EdgeInsets.all(3),
                      
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(3)),
                    color: Colors.red,
                  ),
                  child: Text(status,style: TextStyle(color: Colors.white),),
                ),
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Container(
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(3),
                                  bottomRight: Radius.circular(3))),
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${lstproduct[i].tenSanPham}'.length < 35
                                        ? '${lstproduct[i].tenSanPham}'
                                        : lstproduct[i]
                                                .tenSanPham!
                                                .substring(0, 34) +
                                            "...",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    )),
                                    status==""|| status=="Mới"?Text(f.format(lstproduct[i].giaBan),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17)):
                                Text(f.format(lstproduct[i].giaNhap),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17)),
                                        Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              final snackBar = SnackBar(
                                                content: Text(
                                                    'Thêm sản phẩm thành công'),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                                  id = await storage.read(key: 'id');
                                              String data =
                                                  await CallApi.addCart(
                                                      id!,
                                                      lstproduct[i]
                                                          .id
                                                          .toString(),
                                                      1);
                                            },
                                            child: Icon(
                                              Icons.shopping_cart_rounded,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      )
                              ],
                            ),
                          )),
                    ]),
                    
                  ],
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(child: CircularProgressIndicator())
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Scaffold(
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
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 13,
                    ),
                    // vi tri
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const <Widget>[
                        Icon(
                          Icons.home,
                          size: 20,
                        ),
                        Positioned(
                          left: -20,
                          child: Text(
                              "Khu vực của bạn: Lý Chính Thắng, Q3, TPHCM"),
                        ),
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
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
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
                    // Center(
                    //   child: buildIndicator(),
                    // ),

                    //san pham moi
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Sản phẩm mới",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TotalNewProduct(lstPro: lstproduct,banner:banners[0])));
                            },
                            child: Text("Tất cả"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 250.0,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (int i = 0; i < product; i++) card(i,banners[0]),
                            ])),

                    //sp khuyen mai
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Sản phẩm khuyến mãi",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TotalNewProduct(lstPro: lstproduct,banner: banners[1],)));
                            },
                            child: const Text("Tất cả"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 250.0,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (int i = 0; i < product; i++) card(i,banners[1]),
                            ])),
                  ],
                ),
              ),
            ),
          );
  }
}
