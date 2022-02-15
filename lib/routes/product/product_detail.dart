import 'package:ban_laptop/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'category_screen.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // late final ProductDemo product;
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
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 250,
                            child: AspectRatio(
                              aspectRatio: 1.02,
                              child: Image.asset(
                                  'assets/images/products/macOs.jpg'),
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
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 20),
                        child: const Text(
                          "MacBook Pro 14 M1 Max 2021/32-core ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 700,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              spreadRadius: 1, //Bán kính lan rộng
                              blurRadius: 5, //Làm mờ bán kính
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "21.999.000 VNĐ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.black,
                                color: Colors.red,
                                decorationStyle: TextDecorationStyle.solid,
                              ),
                            ),
                            Text(
                              "20.199.000 VNĐ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        height: 50,
                        width: 700,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              spreadRadius: 1, //Bán kính lan rộng
                              blurRadius: 5, //Làm mờ bán kính
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "Mô tả sản phẩm",
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'HIỆU NĂNG ẤN TƯỢNG TỪ CHIP M1'
                          '\n\nChip M1 được Apple thiết kế dành riêng cho MacBook mang đến hiệu năng vượt trội. Thực hiện tốt các tác vụ văn phòng trên các phần mềm như Word, Excel, Powerpoint,... Thiết kế đồ hoạ cũng chuyên nghiệp không kém, cho phép bạn chỉnh sửa hình ảnh với dung lượng lớn, kết xuất 2D mượt mà trên các phần mềm Photoshop, AI, Figma,...'
                          '\n\n Card đồ họa GPU 7 nhân đem lại hiệu suất cao đáng kinh ngạc, đồ họa cao hơn gấp 5 lần, thảo sức sáng tạo nội dung, kết xuất 3D ổn định, render video, phát trực tiếp với chất lượng cao với chất ảnh sắc nét cùng độ phân giải lên đến 4K.'
                          '\n\nBộ nhớ RAM 16 GB cho phép bạn sử dụng đa nhiệm, bạn có thể thao tác nhiều ứng dụng cùng một lúc thoải mái với những tác vụ như lướt web, soạn thảo văn bản, xem video hay thiết kế hình ảnh bằng Photoshop, Adobe IIIustrator,...'
                          '\n\nỔ cứng SSD 256 GB giúp máy có tốc độ đọc ghi nhanh chóng đồng thời mang lại không gian bộ nhớ đủ lớn phục vụ cho nhu cầu lưu trữ của bạn như tài liệu trong học tập, dữ liệu trong công việc, các bộ phim hoặc bản nhạc trong giải trí. Đồng thời, tiết kiệm được thời gian khởi động máy hoặc mở các ứng dụng nặng, cải thiện được thời gian mở nhanh chóng hơn.'
                          '\n\nFaceTime Camera cho hình ảnh rõ nét kết hợp với 3 microphone thuận tiện cho nhu cầu họp hoặc học online hay hội đàm trực tuyến, giải quyết hiệu quả công việc từ xa qua các phần mền Zoom, Google Meet,...'
                          '\n\nHệ thống loa kép cho âm thanh to rõ, sống động để bạn có trải nghiệm nghe nhạc, xem phim và gọi điện trực tuyến thoải mái với âm thanh chất lượng cao. Tạo cho bạn cảm giác đắm chìm trong những chương trình giải trí hấp dẫn.',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10),
                        height: 50,
                        width: 700,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              spreadRadius: 1, //Bán kính lan rộng
                              blurRadius: 5, //Làm mờ bán kính
                              offset: const Offset(
                                  0, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "Thông tin chi tiết",
                              style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 600,
                        child: DataTable(
                          border: const TableBorder(
                            horizontalInside: BorderSide(color: Colors.blue),
                            //right: BorderSide(color: Colors.blue.shade400),
                            //bottom: BorderSide(color: Colors.blue.shade400),
                            //top: BorderSide(color: Colors.blue.shade400),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[90],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          columns: const [
                            DataColumn(
                              label: Text(
                                'Tên',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Thông số',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text('CPU')),
                              DataCell(Text('Apple M1')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('RAM')),
                              DataCell(Text('16GB')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Ổ Cứng')),
                              DataCell(Text('512 SSD')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Màn hình')),
                              DataCell(Text('13.3" Retina (2560 x 1600)')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Card màn hình')),
                              DataCell(Text('Card tích hợp 8 nhân CPU')),
                            ]),
                          ],
                        ),
                      ),
                      Row(
                        //Do chạy trên chorm khác vs máy ảo nên sài như vậy cho chắc
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(10),
                            height: 50,
                            //width: 234,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  spreadRadius: 1, //Bán kính lan rộng
                                  blurRadius: 5, //Làm mờ bán kính
                                  offset: const Offset(
                                      0, 5), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "Đánh giá sản phẩm",
                                  style: TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 2),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(5),
                            height: 50,
                            //width: 234,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  spreadRadius: 1, //Bán kính lan rộng
                                  blurRadius: 5, //Làm mờ bán kính
                                  offset: const Offset(
                                      0, 5), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 28.0,
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                  size: 28.0,
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                  size: 28.0,
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                  size: 28.0,
                                ),
                                Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                  size: 28.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        //color: Colors.blue[300],
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 10, right: 10),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Tất cả bình luận',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue[100],
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.left,
                                children: [
                                  const Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                  Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: const Text(
                                                  'Trần Hiếu Khoa',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: const Text('5 phút'),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Row(
                                              children: const [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 20.0,
                                                ),
                                                Icon(
                                                  Icons.star_border,
                                                  color: Colors.yellow,
                                                  size: 20.0,
                                                ),
                                                Icon(
                                                  Icons.star_border,
                                                  color: Colors.yellow,
                                                  size: 20.0,
                                                ),
                                                Icon(
                                                  Icons.star_border,
                                                  color: Colors.yellow,
                                                  size: 20.0,
                                                ),
                                                Icon(
                                                  Icons.star_border,
                                                  color: Colors.yellow,
                                                  size: 20.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                right: 110),
                                            child: const Text(
                                                'Sản phẩm quá tệ :(( '),
                                          ),
                                          Column(
                                            children: const [
                                              Icon(
                                                Icons.reply,
                                                color: Colors.blue,
                                                size: 20.0,
                                              ),
                                              Text(
                                                'Trả lời',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // padding: const EdgeInsets.only(top: 10),
                        // child: TextField(
                        //   maxLines: 5,
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10.0),
                        //     ),
                        //     hintText: 'Nội dung đánh giá',
                        //   ),
                        // ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                hintText: 'Nhận xét của bạn về sản phẩm',
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 70,
                            height: 50,
                            decoration: BoxDecoration(
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: MaterialButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.send,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      Text(
                        'Đây là mô tả sản phẩm',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                )
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
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue[100],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 20,
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.chat,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 200,
                  padding: const EdgeInsets.only(left: 30),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "Thêm vào giỏ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.red[300],
                    //height: 50,
                    //minWidth: 100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Text(
                      "Mua ngay",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.only(bottom: 3),
          //   child: MaterialButton(
          //     onPressed: () {},
          //     color: Colors.blue,
          //     height: 50,
          //     minWidth: 100,
          //     // shape: RoundedRectangleBorder(
          //     //   borderRadius: BorderRadius.circular(15),
          //     // ),
          //     child: const Text(
          //       "Đặt mua",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white,
          //         fontSize: 25,
          //       ),
          //     ),
          //   ),
          // ),
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
        border: Border.all(color: Colors.blue),
      ),
      child: Image.asset('assets/images/products/macOs.jpg'),
    );
  }
}
