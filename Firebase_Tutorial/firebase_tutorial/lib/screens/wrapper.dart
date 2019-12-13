import 'package:firebase_tutorial/screens/authenticate/authenticate.dart';
import 'package:firebase_tutorial/screens/home/home.dart';
import 'package:flutter/material.dart';

/*
  Tầng Wrapper này là tầng mà sẽ lắng nghe xác thực từ phía Authenticate
  Nó là tầng chính giữa trong App
  Khi tần Wrapper này 
      + check Not logged in -> Chuyển sang Screen - Authenticate
      + check Logeed in -> Chuyển sang Screen - Home
*/


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return either Home or Authenticate widget
    return Authenticate();
  }
}