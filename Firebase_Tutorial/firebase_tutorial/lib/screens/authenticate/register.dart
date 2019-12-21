import 'package:firebase_tutorial/services/auth.dart';
import 'package:firebase_tutorial/shared/constants.dart';
import 'package:firebase_tutorial/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0, // Độ cao của appbard
              title: Text('Register Brew Crew'),
              centerTitle: true,
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
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
            body: Container(
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
                    SizedBox(height: 20.0),
                    TextFormField(
                        /*
                    Làm đẹp cho TextFormField
                    hiển thị chũ nhạt ở dưới
                  */
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Email'),
                        /* 
                    Validator là dòng hiển thị ở dưới TextFormField
                    ở đây khi val.emty thì sẽ hiện "Enter an email"
                  */
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(height: 20.0),
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
                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: Colors.pink[400],
                        child: Text('Register',
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
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Please supply a valid email';
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
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.cover,
              )),
            ));
  }
}
