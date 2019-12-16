import 'package:firebase_tutorial/models/user.dart';
import 'package:firebase_tutorial/screens/authenticate/authenticate.dart';
import 'package:firebase_tutorial/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    
    /* Truy cập dữ liệu người dùng từ nhà cung cấp 
       mỗi khi nhận được một dữ liệu mới
    */
    final user = Provider.of<User>(context);
    print(user);
    
    // Return either Home or Authenticate widget
    // return Authenticate();

    /* Check User -> Go to Screen */
    if(user == null) 
    {
      return Authenticate();
    }
    else
    {
      return Home();
    }
  }
}