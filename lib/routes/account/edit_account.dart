import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  Object? _val = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cập nhật thông tin'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Họ và tên'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                label: Text('0329290298'),
                border: OutlineInputBorder(),
                enabled: false,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Ngày sinh'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15,0,15,0),
            child: Column(
              children: [
                const ListTile(
                  title: Text('Giới tính'),
                ),
                RadioListTile(
                  title: Text('Nam'),
                  value: 1,
                  groupValue: _val,
                  onChanged: (value) {
                    setState(() {
                      _val = value;
                    });
                  },
                ),
              RadioListTile(
                title: Text('Nữ'),
                value: 2,
                groupValue: _val,
                onChanged: (value) {
                    setState(() {
                    _val = value;
                  });
                },
              ),
            ],
          ),
                    
              
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: const Padding(
                padding: EdgeInsets.all(17),
                child: Text('Cập nhật', style: TextStyle(fontSize: 20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
