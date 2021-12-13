import 'package:flutter/material.dart';
// page transition lib
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
//routes 
import 'routes/account_infomation.dart';
import 'routes/password_setting.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  //static const primaryColor = Color(0xFF4478DE);
  static const double sizeIcon = 30;
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài Khoản'),
      ),
      body: ListView(
        children: [
          //const SizedBox(height: 20,),
          Card(
            child: ListTile(
              title: const Text('Username'),
              subtitle: const Text('Phone number'),
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              onTap: () {
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const AccountInfo()));              
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Card(
            child: ListTile(
                title: Text('Đơn hàng'),
                leading: Icon(
                  Icons.article,
                  size: sizeIcon,
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  size: sizeIcon,
                )),
          ),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                    title: const Text('Thông báo'),
                    secondary: const Icon(
                      Icons.notifications,
                      size: sizeIcon,
                    ),
                    value: toggle,
                    onChanged: (value) {
                      setState(() {
                        toggle = value;
                      });
                    }),
                ListTile(
                  title: const Text('Cài đặt mật khẩu'),
                  leading: const Icon(
                    Icons.settings,
                    size: sizeIcon,
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    size: sizeIcon,
                  ),
                  onTap: () {
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const PasswordSetting()));              
              },
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: const [
                ListTile(
                  title: Text('Quyền lợi thành viên'),
                  leading: Icon(Icons.stars, size: sizeIcon),
                  trailing: Icon(Icons.chevron_right, size: sizeIcon),
                ),
                ListTile(
                  title: Text('Điều khoản & Điều kiện'),
                  leading: Icon(Icons.checklist_outlined, size: sizeIcon),
                  trailing: Icon(Icons.chevron_right, size: sizeIcon),
                ),
                ListTile(
                  title: Text('Câu hỏi thường gặp'),
                  leading: Icon(Icons.help_outline, size: sizeIcon),
                  trailing: Icon(Icons.chevron_right, size: sizeIcon),
                ),
                ListTile(
                  title: Text('Liên hệ'),
                  leading: Icon(Icons.support_agent_outlined, size: sizeIcon),
                  trailing: Icon(Icons.chevron_right, size: sizeIcon),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
