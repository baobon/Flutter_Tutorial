import 'package:firebase_tutorial/services/auth.dart';
import 'package:firebase_tutorial/shared/constants.dart';
import 'package:firebase_tutorial/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Khởi tạo AuthService để thừa kế sử dụng trong tác động nút nhấn SignIn
  final AuthService _auth = AuthService();
  /* 
    GlobalKey<FormState> được dùng để check các biểu mẫu nhập liệu
    Ví dụ như kiểm tra tên email nhập đúng chưa....password... 
  */
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  //Text Field State
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    /* Scaffold đóng vai trò như phần nền
     để bố trí các thành phần khác theo phong các Material Design */

    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0, // Độ cao của appbard
              title: Text('Login Brew Crew'),
              centerTitle: true,
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            /*
        Container dùng để phân chia bố cục các widget 
        có Padding,broder - thêm, margin - kcach, 
      */
            body: 
            Container(
              /* Padding dùng hàm EdgeInsets.sysmetric để cách khoảng 
        Kiểu giống margin-top,botton,center này kia trong Android
        Nhưng ở đây phải gói gọn lại một EdgeInsets*/
              padding: EdgeInsets.symmetric(
                  vertical: 20.0, // Chiều Dọc
                  horizontal: 50.0 // Chiều Ngang
                  ),
                
              child: Form(
                key:
                    _formKey, // Liên kết formKey ở trên với key để check trạng thái RaiseButton ở dưới
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Password'),
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        obscureText: true, // Ẩn mật khẩu
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                        color: Colors.pink[400],
                        child: Text('Sign In',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () async {
                          /* 
                      Check password and email
                      Hàm formKey.currentState.validate() để xác định thuộc tính của
                      các TextFormField coi đúng như ý định ban đầu không ? dựa vào
                      validator trong TextFormField
                    */
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            // print('valid');
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error =
                                    'could not sign in with those cedentials';
                                loading = false;
                              });
                            }
                          }
                        }),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                    ),
                  ],
                ),
              ),

              /* Khởi tạo một nút nhấn như Button trong Android */
              // child: RaisedButton(
              //   child: Text('Sign in Anonymus'),
              //   onPressed: () async{
              //     /* Sử dụng dynamic - biến động bởi vì nó có thể là null hoặc sẽ trả
              //     về người dùng...
              //     Khởi tạo biến động result lấy kết quả trả về
              //     */
              //     dynamic result = await _auth.signInAnon();
              //     /*
              //       Kiểm tra
              //     */
              //     if(result == null)
              //     {
              //       print('Error sign in');
              //     }else{
              //       print('Sign In');
              //       print(result.uid);
              //     }
              //   }
              // ),
            ));
  }
}
