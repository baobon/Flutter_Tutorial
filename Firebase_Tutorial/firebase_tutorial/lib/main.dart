import 'package:firebase_tutorial/models/user.dart';
import 'package:firebase_tutorial/screens/wrapper.dart';
import 'package:firebase_tutorial/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
        Sử dụng Stream Provider để realtime lấy dữ liệu từ <User>
        Lắng nghe dữ liệu từ người dùng  
    */
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
      home: Wrapper(),
      ),
    );
  }
}
