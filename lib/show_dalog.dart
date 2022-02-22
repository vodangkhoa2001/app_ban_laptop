import 'package:flutter/material.dart';

class ShowBox extends StatefulWidget {
  ShowBox({Key? key, required this.message,required this.widget}) : super(key: key);
  String message;
  Widget widget;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title: const Text('Thông báo'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
