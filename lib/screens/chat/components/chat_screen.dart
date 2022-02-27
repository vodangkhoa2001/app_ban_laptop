// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Widget admin(String mess, var time) => Container(
        margin: EdgeInsets.only(left: 40, right: 100, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListTile(
          title: Text(
            mess,
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text(time)],
          ),
        ),
      );

  Widget user(String mess, var time) => Container(
        margin: EdgeInsets.only(left: 100, right: 40, bottom: 20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListTile(
          title: Text(
            mess,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusScopeNode currentFocus = FocusScope.of(context);
        //  if (!currentFocus.hasPrimaryFocus) {
        //   currentFocus.unfocus();
        // }
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
              title: Row(children: [
            CircleAvatar(
              child: Icon(Icons.support_agent_outlined),
            ),
            SizedBox(
              width: 10,
            ),
            Text('CSKH'),
          ])),
          body: Container(
            color: Colors.grey[200],
            child: ListView(children: [
              admin('Xin chào! KHK mart có thể giúp gì được cho bạn', '11:00'),
              user(
                  'Cho mình hỏi có laptop nào giá hợp lý cho sinh viên hay không?',
                  '11:02'),
              admin(
                  'Cám ơn bạn đã nhắn tin cho chúng tôi! Nhân viên của chúng tôi sẽ nhắn lại sau ít phút.',
                  '11:02'),
              admin('Xin chào bạn! Mình là Khoa, mình sẽ tư vấn cho bạn',
                  '11:19'),
              admin(
                  'Hiện tại bên mình có các dòng sản phẩm gamer và ultrabook. Không biết bạn muốn mình tư vấn loại nào',
                  '11:20'),
              user('gamer đi ạ', '11:22'),
            ]),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nhập tin nhắn...',
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Icon(Icons.send_rounded),
                  )),
            ),
          )),
    );
  }
}
