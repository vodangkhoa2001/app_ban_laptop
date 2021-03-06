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
              admin('Xin ch??o! KHK mart c?? th??? gi??p g?? ???????c cho b???n', '11:00'),
              user(
                  'Cho m??nh h???i c?? laptop n??o gi?? h???p l?? cho sinh vi??n hay kh??ng?',
                  '11:02'),
              admin(
                  'C??m ??n b???n ???? nh???n tin cho ch??ng t??i! Nh??n vi??n c???a ch??ng t??i s??? nh???n l???i sau ??t ph??t.',
                  '11:02'),
              admin('Xin ch??o b???n! M??nh l?? Khoa, m??nh s??? t?? v???n cho b???n',
                  '11:19'),
              admin(
                  'Hi???n t???i b??n m??nh c?? c??c d??ng s???n ph???m gamer v?? ultrabook. Kh??ng bi???t b???n mu???n m??nh t?? v???n lo???i n??o',
                  '11:20'),
              user('gamer ??i ???', '11:22'),
            ]),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nh???p tin nh???n...',
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Icon(Icons.send_rounded),
                  )),
            ),
          )),
    );
  }
}
