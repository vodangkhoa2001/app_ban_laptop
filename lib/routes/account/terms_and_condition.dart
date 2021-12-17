
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({ Key? key }) : super(key: key);

  @override
  _TermsAndConditionState createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Điều khoản & điều kiện'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10,top: 20,bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('ĐIỀU KIỆN VỀ GIAO DỊCH CHUNG TẠI KHK',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                SizedBox(height: 10,),
                Text('1. Giới thiệu',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Khi vào ứng dụng của chúng tôi, người dùng tối thiểu phải 18 tuổi hoặc truy cập dưới sự giám sát của cha mẹ hay người giám hộ hợp pháp.'),
                SizedBox(height: 5,),
                Text('- Chúng tôi cấp giấy phép sử dụng để bạn có thể mua sắm trên web trong khuôn khổ điều khoản và điều kiện sử dụng đã đề ra.'),
                SizedBox(height: 5,),
                Text('- Nghiêm cấm sử dụng bất kỳ phần nào của trang web này với mục đích thương mại hoặc nhân danh bất kỳ đối tác thứ ba nào nếu không được chúng tôi cho phép bằng văn bản. Nếu vi phạm bất cứ điều nào trong đây, chúng tôi sẽ hủy giấy phép của bạn mà không cần báo trước.'),
                SizedBox(height: 10,),
                Text('2. Chấp nhận đơn hàng và giá cả',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Chúng tôi có quyền từ chối hoặc hủy đơn hàng của quý khách vì bất kỳ lý do gì vào bất kỳ lúc nào. Chúng tôi có thể hỏi thêm về số điện thoại và địa chỉ trước khi nhận đơn hàng.'),
                SizedBox(height: 5,),
                Text('- Chúng tôi cam kết sẽ cung cấp thông tin giá cả chính xác nhất cho người tiêu dùng. Tuy nhiên, đôi lúc vẫn có sai sót xảy ra, ví dụ như trường hợp giá sản phẩm không hiển thị chính xác trên trang web hoặc sai giá, tùy theo từng trường hợp chúng tôi sẽ liên hệ hướng dẫn hoặc thông báo hủy đơn hàng đó cho quý khách. Chúng tôi cũng có quyền từ chối hoặc hủy bỏ bất kỳ đơn hàng nào dù đơn hàng đó đã hay chưa được xác nhận hoặc đã bị thanh toán.'),
                SizedBox(height: 10,),
                Text('3. Thương hiệu và bản quyền',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Mọi quyền sở hữu trí tuệ (đã đăng ký hoặc chưa đăng ký), nội dung thông tin và tất cả các thiết kế, văn bản, đồ họa, phần mềm, hình ảnh, video, âm nhạc, âm thanh, biên dịch phần mềm, mã nguồn và phần mềm cơ bản đều là tài sản của chúng tôi. Toàn bộ nội dung của trang web được bảo vệ bởi luật bản quyền của Việt Nam và các công ước quốc tế. Bản quyền đã được bảo lưu.'),
                SizedBox(height: 10,),
                Text('4. Quyền pháp lý',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('- Các điều kiện, điều khoản và nội dung của trang web này được điều chỉnh bởi luật pháp Việt Nam và Tòa án có thẩm quyền tại Việt Nam sẽ giải quyết bất kỳ tranh chấp nào phát sinh từ việc sử dụng trái phép trang web này.')

              ],
            ),
          ),
        ],
      )
    );
  }
}
