import 'package:firebase_tutorial/screens/authenticate/register.dart';
import 'package:firebase_tutorial/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

/*
    * A StatefulWidget can REBUILD by itself  ( not use from external events )
    - StatefulWidget có thể tự xây dựng lại chính nó (không cần sự kiện 
    bên ngoài như StatelessWidget)
    * StatefulWidget creates a new State object for each BuildContext
    - StatefulWidget tạo ra mỗi đối tượng về trạng thái mới cho mỗi lần BuildContext

 */

/*
  Keyword : stfu ->
  Tạo một class Authenticate thừa kế StatefulWidget
*/

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   // child: Text('Authenticate'),   /* Text = "Authenitcate" */ 
    //   child: Register(),
    // );
    if(showSignIn)
    {
        return SignIn(toggleView: toggleView);
    }else
    {
      return Register(toggleView: toggleView);
    }

  }
}