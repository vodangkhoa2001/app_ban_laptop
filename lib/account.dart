import 'package:ban_laptop/routes/account/terms_and_condition.dart';
import 'package:flutter/material.dart';
// page transition lib
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
//routes 
import 'routes/account/account_infomation.dart';
import 'routes/account/contact.dart';
import 'routes/account/password_setting.dart';
import 'routes/account/terms_and_condition.dart';
import 'routes/account/membership_benefits.dart';
import 'routes/account/frequently_asked_question.dart';
import 'routes/account/order.dart';


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
          Card(
            child: ListTile(
                title: const Text('Đơn hàng'),
                leading: const Icon(
                  Icons.article,
                  size: sizeIcon,
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  size: sizeIcon,
                ),
                onTap: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const Order()));              
                },
            ),
                
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
              children: [
                ListTile(
                  title: const Text('Quyền lợi thành viên'),
                  leading:const Icon(Icons.stars, size: sizeIcon),
                  trailing:const Icon(Icons.chevron_right, size: sizeIcon),
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const Membership()));              
                  },
                ),
                ListTile(
                  title: const Text('Điều khoản & Điều kiện'),
                  leading: const Icon(Icons.checklist_outlined, size: sizeIcon),
                  trailing: const Icon(Icons.chevron_right, size: sizeIcon),
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const TermsAndCondition()));              
                  },
                ),
                ListTile(
                  title: const Text('Câu hỏi thường gặp'),
                  leading: const Icon(Icons.help_outline, size: sizeIcon),
                  trailing: const Icon(Icons.chevron_right, size: sizeIcon),
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const FrequentlyAskedQuestion()));              
                  },
                ),
                ListTile(
                  title: const Text('Liên hệ'),
                  leading: const Icon(Icons.support_agent_outlined, size: sizeIcon),
                  trailing: const Icon(Icons.chevron_right, size: sizeIcon),
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: const Contacts()));              
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
