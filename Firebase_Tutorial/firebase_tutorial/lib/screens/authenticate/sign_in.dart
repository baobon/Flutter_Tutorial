import 'package:firebase_tutorial/screens/authenticate/authenticate.dart';
import 'package:firebase_tutorial/screens/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  // Khởi tạo AuthService để thừa kế sử dụng trong tác động nút nhấn SignIn
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    /* Scaffold đóng vai trò như phần nền
     để bố trí các thành phần khác theo phong các Material Design */
    return Scaffold( 
      backgroundColor: Colors.brown[100],     
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,                         // Độ cao của appbard
        title: Text('Sign in to Brew Crew'),
      ),
      /*
        Container dùng để phân chia bố cục các widget 
        có Padding,broder - thêm, margin - kcach, 
      */
      body: Container( 
        /* Padding dùng hàm EdgeInsets.sysmetric để cách khoảng 
        Kiểu giống margin-top,botton,center này kia trong Android
        Nhưng ở đây phải gói gọn lại một EdgeInsets*/
        padding: EdgeInsets.symmetric(
          vertical: 20.0,                 // Chiều Dọc
          horizontal: 50.0                // Chiều Ngang
          ),
        /* Khởi tạo một nút nhấn như Button trong Android */
        child: RaisedButton( 
          child: Text('Sign in Anonymus'),
          onPressed: () async{
            /* Sử dụng dynamic - biến động bởi vì nó có thể là null hoặc sẽ trả 
            về người dùng... 
            Khởi tạo biến động result lấy kết quả trả về
            */
            dynamic result = await _auth.signInAnon();
            /* 
              Kiểm tra
            */
            if(result == null)
            {
              print('Error sign in');
            }else{
              print('Sign In');
              print(result.uid);
            }
          }
        ),
      )
    );
  }
}