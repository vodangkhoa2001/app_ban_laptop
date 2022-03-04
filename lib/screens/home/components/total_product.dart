// ignore_for_file: prefer_const_constructors

import 'package:ban_laptop/models/product/product.dart';
import 'package:ban_laptop/routes/product/product_detail.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class TotalNewProduct extends StatefulWidget {
  TotalNewProduct({Key? key, required this.lstPro, required this.banner})
      : super(key: key);
  List<Product> lstPro = [];
  String banner;

  @override
  State<TotalNewProduct> createState() => _TotalNewProductState(lstPro, banner);
}

class _TotalNewProductState extends State<TotalNewProduct> {
  List<Product> lstPro = [];
  String banner;
  _TotalNewProductState(this.lstPro, this.banner);
  final f = new NumberFormat("#,##0", "vi_VN");
   final storage = FlutterSecureStorage();
  String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tất cả sản phẩm ' + banner.toLowerCase()),
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.67,
          ),
          itemCount: lstPro.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Details(product: lstPro[index],banner: banner,)));
              },
              child: Card(
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
                            child: Image.network('${lstPro[index].hinhAnh}'),
                          ),
                          Container(
                            // alignment: Alignment.center,
                            padding: EdgeInsets.all(3),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(3)),
                              color: Colors.red,
                            ),
                            child: Text(
                              banner,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '${lstPro[index].tenSanPham}'
                                                          .length <
                                                      35
                                                  ? '${lstPro[index].tenSanPham}'
                                                  : lstPro[index]
                                                          .tenSanPham!
                                                          .substring(0, 34) +
                                                      "...",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              )),
                                          banner==""|| banner=="Mới"?Text(f.format(lstPro[index].giaBan),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17)):
                                Text(f.format(lstPro[index].giaNhap),
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
                                                      lstPro[index]
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
                      ))),
            );
          }),
    );
  }
}
