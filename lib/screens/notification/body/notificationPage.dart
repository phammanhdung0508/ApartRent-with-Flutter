// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:apart_rent/screens/notification/body/appBar.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FB),
      appBar: appBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Chúc mừng bạn đã thuê thành công!',
            style: TextStyle(color: Colors.black54, fontSize: 30),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
