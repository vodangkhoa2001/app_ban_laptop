// ignore_for_file: prefer_const_constructors

import 'package:ban_laptop/main.dart';
import 'package:ban_laptop/models/product/product.dart';
import 'package:ban_laptop/routes/account/terms_and_condition.dart';
import 'package:ban_laptop/routes/login_signup/login_signup.dart';
import 'package:ban_laptop/services/api.dart';
import 'package:flutter/material.dart';
// page transition lib
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';
//routes
import 'package:ban_laptop/routes/account/account_infomation.dart';
import 'package:ban_laptop/routes/account/contact.dart';
import 'package:ban_laptop/routes/account/password_setting.dart';
// import 'package:ban_laptop/routes/account/terms_and_condition.dart';
import 'package:ban_laptop/routes/account/membership_benefits.dart';
import 'package:ban_laptop/routes/account/frequently_asked_question.dart';
import 'package:ban_laptop/routes/account/order.dart';
import 'package:ban_laptop/routes/product/provider/account_provider.dart';
import 'package:ban_laptop/models/account/account.dart';
import 'package:ban_laptop/screens/loading.dart';

final storage = new FlutterSecureStorage();

class Account extends StatefulWidget {
  Account({Key? key }) : super(key: key);
  // Product product;
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  UserAccount? account;
  // Product product;
  // _AccountState(this.product);
  bool _loading = false;

  _loadAccount() async {
    String? id = await storage.read(key: "id");
    final data = await CallApi.getUserInfo(id!);
    setState(() {
      account = data;
    });
  }

  void _onLoading() {
    setState(() {
      if (account == null) {
        _loading = true;
        new Future.delayed(new Duration(seconds: 1), _onLoading);
      } else {
        _loading = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _loadAccount();
    _onLoading();
  }

  //static const primaryColor = Color(0xFF4478DE);
  static const double sizeIcon = 30;
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T??i Kho???n'),
        automaticallyImplyLeading: false,
      ),
      body: _loading
          ? Loading()
          : ListView(
              children: [
                //const SizedBox(height: 20,),
                Card(
                  child: ListTile(
                    title: Text(account!.fullName),
                    subtitle: Text(account!.phone),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(account!.avatar),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: AccountInfo(
                                account: account!,
                              )));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: ListTile(
                    title: const Text('????n h??ng'),
                    leading: const Icon(
                      Icons.article,
                      size: sizeIcon,
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      size: sizeIcon,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: Order()));
                    },
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      SwitchListTile(
                          title: const Text('Th??ng b??o'),
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
                        title: const Text('Thay ?????i m???t kh???u'),
                        leading: const Icon(
                          Icons.settings,
                          size: sizeIcon,
                        ),
                        trailing: const Icon(
                          Icons.chevron_right,
                          size: sizeIcon,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: PasswordSetting(email: account!.email,)));
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Quy???n l???i th??nh vi??n'),
                        leading: const Icon(Icons.stars, size: sizeIcon),
                        trailing:
                            const Icon(Icons.chevron_right, size: sizeIcon),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const Membership()));
                        },
                      ),
                      ListTile(
                        title: const Text('??i???u kho???n & ??i???u ki???n'),
                        leading: const Icon(Icons.checklist_outlined,
                            size: sizeIcon),
                        trailing:
                            const Icon(Icons.chevron_right, size: sizeIcon),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const TermsAndCondition()));
                        },
                      ),
                      ListTile(
                        title: const Text('C??u h???i th?????ng g???p'),
                        leading: const Icon(Icons.help_outline, size: sizeIcon),
                        trailing:
                            const Icon(Icons.chevron_right, size: sizeIcon),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const FrequentlyAskedQuestion()));
                        },
                      ),
                      ListTile(
                        title: const Text('Li??n h???'),
                        leading: const Icon(Icons.support_agent_outlined,
                            size: sizeIcon),
                        trailing:
                            const Icon(Icons.chevron_right, size: sizeIcon),
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const Contacts()));
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text(
                      '????ng xu???t',
                      style: TextStyle(color: Colors.redAccent[200]),
                    ),
                    leading: Icon(Icons.logout,
                        size: sizeIcon, color: Colors.redAccent[200]),
                    //trailing: Icon(Icons.chevron_right, size: sizeIcon,colorsColors.red[300],),
                    onTap: () async {
                      await storage.delete(key: 'id');
                      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoadingScreen()),
          (Route<dynamic> route) => false);
                    },
                  ),
                )
              ],
            ),
    );
  }
}
