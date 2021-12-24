import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  static const colorComplete = Color(0xFF26AA99);
  static const colorDisable = Color(0xFF7B7B7B);
  double borderRadius = 30;
  double fontSizeSmall = 10;
  double sizeIcon = 30;
  double widthLine = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chi tiết đơn hàng'),
        ),
        body: ListView(
          children: [
            Container(
                  width: 360,
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0,color:Color(0xFFCCCCCC)),
                    
                  ),),
                  padding:const EdgeInsets.all(10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: const [Text('ID Đơn hàng: 210612574G7G8S'),],
                  )
                ),
            Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              // decoration:BoxDecoration(
                              //   border:Border.all(width:1.0),
                              // ),
                              child: Column(
                                children: [
                                  Row(children: [
                                    Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(width:1.0,color: colorComplete),
                                    borderRadius:
                                        BorderRadius.circular(borderRadius)),
                                  child: Row(
                                    children: [
                                    Icon(Icons.receipt,
                                        size: sizeIcon, color: colorComplete),
                                    ],
                                    
                                    ),
                                  ),
                                  
                                  ],
                                
                                ),                                
                              ],
                            )

                            ),
                            SizedBox(
                              width: widthLine,
                              height:50,
                              child: const Divider(
                                thickness: 1,
                                color: colorComplete,
                              ),
                            ),
                             
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Đang xác \nnhận đơn hàng',
                          style: TextStyle(
                            color: colorComplete,
                            fontSize: fontSizeSmall,
                          ),
                          textAlign: TextAlign.center),

                      ],
                    ),
                    
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: colorComplete),
                                  borderRadius:
                                      BorderRadius.circular(borderRadius)),
                              child: Row(
                                children: [
                                  // ignore: avoid_unnecessary_containers
                                  Container(
                                    //backgroundColor: Colors.transparent,
                                    child: Stack(children: [
                                      Icon(
                                        Icons.receipt_outlined,
                                        size: sizeIcon,
                                        color: colorComplete,
                                      ),
                                      const Positioned(
                                        child: CircleAvatar(
                                          backgroundColor: colorComplete,
                                          radius: 7.0,
                                          child: Icon(
                                            Icons.done,
                                            size: 12.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        bottom: 1,
                                        right: 1,
                                      )
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: widthLine,
                              child: const Divider(
                                thickness: 1,
                                color: colorComplete,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: colorComplete),
                                  borderRadius:
                                      BorderRadius.circular(borderRadius)),
                              child: Row(
                                children: [
                                  Icon(Icons.local_shipping_outlined,
                                      size: sizeIcon, color: colorComplete),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: widthLine,
                              child: const Divider(
                                thickness: 1,
                                color: colorComplete,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: colorComplete),
                                  borderRadius:
                                      BorderRadius.circular(borderRadius)),
                              child: Row(
                                children: [
                                  Icon(Icons.inventory_2_outlined,
                                      size: sizeIcon, color: colorComplete),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: widthLine,
                              child: const Divider(
                                thickness: 1,
                                color: colorComplete,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: colorComplete),
                                  borderRadius:
                                      BorderRadius.circular(borderRadius)),
                              child: Row(
                                children: [
                                  Icon(Icons.stars_rounded,
                                      size: sizeIcon, color: colorComplete),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Container(
                //       padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                //       child: Text('Đang xác \nnhận đơn hàng',
                //           style: TextStyle(
                //             color: colorComplete,
                //             fontSize: fontSizeSmall,
                //           ),
                //           textAlign: TextAlign.center),
                //     ),
                //     // ignore: avoid_unnecessary_containers
                //     Container(
                //       // padding:EdgeInsets.fromLTRB(5, 0, 5, 0),
                //       child: Text('Đã xác \nnhận đơn hàng',
                //           style: TextStyle(
                //             color: colorComplete,
                //             fontSize: fontSizeSmall,
                //           ),
                //           textAlign: TextAlign.center),
                //     ),
                //     Container(
                //       padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                //       child: Text('Đã giao\ncho ĐVVC',
                //           style: TextStyle(
                //             color: colorComplete,
                //             fontSize: fontSizeSmall,
                //           ),
                //           textAlign: TextAlign.center),
                //     ),
                //     Container(
                //       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                //       child: Text('Đang\n giao hàng',
                //           style: TextStyle(
                //             color: colorComplete,
                //             fontSize: fontSizeSmall,
                //           ),
                //           textAlign: TextAlign.center),
                //     ),
                //     Container(
                //       padding: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                //       child: Text('Đơn hàng\n đã được giao',
                //           style: TextStyle(
                //             color: colorComplete,
                //             fontSize: fontSizeSmall,
                //           ),
                //           textAlign: TextAlign.center),
                //     ),
                //   ],
                // ),
              
              ],
            ),
            const SizedBox(height: 30,),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top:BorderSide(width: 1.0,color:Color(0xFFCCCCCC)),
                  bottom:BorderSide(width: 1.0,color:Color(0xFFCCCCCC)),
                ),
              ),  
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  
                  SizedBox(height:20),
                  Padding(
                    padding: EdgeInsets.only(left:10),
                    child: Text('Thông tin nhận hàng',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize:17),
                    ),
                  ),
                  SizedBox(height:20),
                  Padding(
                    padding:EdgeInsets.only(left:10),
                    child: Text('Số điện thoại: 0329290298'),
                  ),
                  Padding(
                    padding:EdgeInsets.all(10),
                    child: Text('Địa chỉ: ấp Gò Nổi, xã Ninh Điền, huyện Châu Thành, tỉnh Tây Ninh'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
