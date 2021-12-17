import 'package:flutter/material.dart';

class FrequentlyAskedQuestion extends StatelessWidget {
  const FrequentlyAskedQuestion({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Câu hỏi thường gặp'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10,top: 20,bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('CÁC CÂU HỎI THƯỜNG GẶP',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                SizedBox(height: 10,),
                Text('1. Quyền lợi khi có tài khoản tích điểm KHK',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('Đăng ký tài khoản/ thẻ tích điểm tại Bibo Mart, Quý khách được nhận nhiều quyền lợi:'),
                SizedBox(height: 5,),
                Text('- Thường xuyên được nhận nhiều khuyến mại hấp dẫn.'),
                SizedBox(height: 5,),
                Text('- Tham gia chương trình vòng quay may mắn với nhiều giải thưởng giá trị.'),
                SizedBox(height: 10,),
                Text('2. Chính sách này có áp dụng cho khách hàng mua buôn không?',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Chính sách KHÔNG áp dụng cho khách hàng mua buôn. Chính sách này chỉ áp dụng cho khách hàng mua lẻ.'),
                SizedBox(height: 10,),
                Text('3.  Mua online có được tích Kxu không?',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Có. Chỉ cần Quý khách đăng ký làm thẻ tích điểm thì mua Online hay mua tại cửa hàng Bibo Mart đều hỗ trợ tích điểm theo Chính sách.'),
                SizedBox(height: 10,),
                Text('4. Đơn hàng như thế nào sẽ được miễn phí vận chuyển?',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Đơn hàng của quý được miễn phí vận chuyển khi thuộc một trong các trường hợp sau:'),
                SizedBox(height: 5,),
                Text('- Đơn được giao đến tại nhà trên toàn quốc.'),
                SizedBox(height: 5,),
                Text('-  Giá trị đơn hàng quý khách đặt từ 15.999.000đ.')

              ],
            ),
          ),
        ],
      ),
    );
  }
}