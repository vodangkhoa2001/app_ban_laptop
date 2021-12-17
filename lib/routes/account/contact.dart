import 'package:flutter/material.dart';
class Contacts extends StatelessWidget {
  const Contacts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Liên hệ'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10,top: 20,bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('CÁC KÊNH LIÊN HỆ VỚI KHK',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),textAlign: TextAlign.center,),
                SizedBox(height: 10,),
                Text('1.  Liên hệ Hotline 1800 6886 (Miễn phí):',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Nhánh 1: Đặt hàng, tư vấn sản phẩm, chương trình khuyến mãi từ Đà Nẵng đến các tỉnh phía Bắc.'),
                SizedBox(height: 5,),
                Text('- Nhánh 2: Đặt hàng, tư vấn sản phẩm, chương trình khuyến mãi từ Quảng Nam đến các tỉnh phía Nam'),
                SizedBox(height: 5,),
                Text('- Nhánh 3: Giải quyết khiếu nại, tư vấn chính sách dành cho Khách hàng.'),
                SizedBox(height: 10,),
                Text('2. Chat trực tiếp trong ứng dụng',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Phần tư vấn ở ứng dụng'),
                SizedBox(height: 10,),
                Text('3. Liên hệ trực tiếp:',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('Văn phòng miền Bắc:',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Địa chỉ: Tầng 10, Handico Tower, đường Phạm Hùng, phường Mễ Trì, quận Nam Từ Liêm, TP. Hà Nội.'),
                SizedBox(height: 5,),
                Text('- Điện thoại: (024) 7309 1168'),
                SizedBox(height: 10,),
                Text('Văn phòng miền Nam:',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Địa chỉ: Tầng 19, Toà nhà TTC, số 253 Hoàng Văn Thụ, P2, Quận Tân Bình, TP.HCM'),
                SizedBox(height: 5,),
                Text('- Điện thoại: (028) 7306 6688'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}