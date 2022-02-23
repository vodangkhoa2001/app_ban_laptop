import 'package:flutter/material.dart';
import 'package:ban_laptop/screens/chat/components/chat_screen.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tư Vấn Khách Hàng'),
        automaticallyImplyLeading: false,
      ),
      body:
        ChatScreen(),
    );
  }
}
