import 'package:firebase_tutorial/services/auth.dart';
import 'package:flutter/material.dart';


/*
  * A StatelessWidget will never rebuild by itself (but can from external events)
  - StatelessWidget nó sẽ không tự rebuild lại (nhưng có thể dùng các sự kiện bên ngoài)
  * Stateless only means that all of its properties are immutable and that the only way 
  to change them is to create a new instance of that widget
  - Stateless có nghĩa là tất cả các thuộc tính của nó là bất biến và không thể tự nó thay đổi
  trừ phi tác động từ bên ngoài
*/

/*
  Class Home thừa kế StatelessWidget
*/

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // return Container(
      // child: Text('Home'),            /* Trả về một Text = "Home" */
      return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title:  Text('Crew Bew'),
          // centerTitle: true,
          elevation: 0.0,
          /*  Icon to the right App Bar*/
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person_pin ),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.SignOut();
              },
            )
          ],
        ),
    );
  }
}