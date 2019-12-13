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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Home'),            /* Trả về một Text = "Home" */
    );
  }
}