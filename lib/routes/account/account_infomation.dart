import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'edit_account.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin tài khoản'),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const EditAccount()));
                },
                child: const Text(
                  'Sửa',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Card(
                  child: Column(
                    children: const [
                      ListTile(
                        title: Text(
                          'Họ và tên',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        trailing: Text('Trần Hiếu Khoa',
                            style: TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        title: Text(
                          'Số điện thoại',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        trailing:
                            Text('0355501316', style: TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        title: Text(
                          'Ngày sinh',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        trailing:
                            Text('06/10/2001', style: TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        title: Text(
                          'Giới tính',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        trailing: Text('Nam', style: TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        title: Text(
                          'Email',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                        trailing: Text('hiukhoa@gmail.com',
                            style: TextStyle(fontSize: 20)),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text(
                          'Địa chỉ giao hàng',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                      ),
                      const ListTile(
                        title: Text(
                            'ấp Gò Nổi, xã Ninh Điền Huyện Châu Thành Tỉnh Tây Ninh',
                            style: TextStyle(fontSize: 15)),
                      ),
                      ButtonBar(
                        children: [
                          FlatButton(
                              onPressed: () {},
                              child: const Text('Sửa',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline))),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
