import 'package:flutter/material.dart';
class Membership extends StatelessWidget {
  const Membership({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quyền lợi thành viên'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10,top: 20,bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('QUYỀN LỢI CỦA THÀNH VIÊN TẠI KHK',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                SizedBox(height: 10,),
                Text('1.  Liên hệ Hotline 1800 6886 (Miễn phí):',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Mỗi khách hàng khi đăng ký thành viên mới thành công tại ứng dụng KHK sẽ nhận ngay 01 (một) voucher trị giá 100,000 VNĐ, áp dụng cho các đơn hàng mua tại ứng dụng và voucher này có giá trị trong 6 tháng kể từ thời điểm phát hành.'),
                SizedBox(height: 5,),
                Text('- Mỗi đơn hàng thực hiện thành công tại ứng dụng KHK khách hàng sẽ được tích điểm dựa theo giá trị đơn hàng đó. Cứ mỗi 10,000 VNĐ chi tiêu khách hàng sẽ tích được 01 (một) điểm.'),
                SizedBox(height: 5,),
                Text('- Khách hàng thành viên được tặng 500 điểm nhân dịp sinh nhật của thành viên.'),
                SizedBox(height: 10,),
                Text('2. Điều kiện đăng ký trở thành Khách Hàng Thân Thiết:',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Các cá nhân từ 15 tuổi trở lên đều có thể đăng ký trở thành thành viên.'),
                SizedBox(height: 5,),
                Text('- Khách hàng có thể đăng ký trực tiếp trên website với các bước đơn giản.'),
                SizedBox(height: 5,),
                Text('- Khách hàng có thể tạo tài khoản bằng cách nhập thông tin đầy đủ theo quy định hoặc đăng nhập bằng tài khoản Facebook, Google cá nhân.'),
                SizedBox(height: 10,),
                Text('3. Những lợi ích của Khách Hàng Thành Viên:',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Được cập nhập thông tin về những chương trình ưu đãi sớm nhất.'),
                SizedBox(height: 5,),
                Text('- Được tặng điểm nhân dịp sinh nhật.'),
                SizedBox(height: 5,),
                Text('- Được hưởng những ưu đãi vô cùng hấp dẫn từ các chương trình khuyến mại của Dell tại website dành cho khách hàng thành viên.'),
              ],
            ),
          ),
        ],
      )
    );
  }
}