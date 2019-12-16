import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/models/user.dart';

class AuthService {
  /*
    Khởi tạo FirebaseAuth kết nối với Server
    Dùng _auth để private biến auth chỉ file này đọc được
   */
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /* 
    Create User object base on FirebaseUser
    Lấy dữ liệu FirebaseUser đưa vào class Model-> User để lưu lại thông tin
  */
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
  /*
      Auth change User Stream 
      Sử dụng một luồng Stream để kiểm tra trạng thái User
      Streams là một chuỗi các sự kiện không đồng bộ. Để hiểu rõ hơn, 
      hãy thử tưởng tượng một đường ống chứa chất lỏng, 
      khi thêm một màu sắc vào đầu này, nó sẽ cập nhật màu sắc của toàn bộ chất lỏng trong ống

      - Hàm Stream tạo ra để lắng nghe giá trị của user
      - Trả về auth_onAuthStateChanged và ánh xạ giá trị vào _userFromFirebaseUser
  */

  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user ) => _userFromFirebaseUser(user));
        // Ánh xạ giá trị auth_
        .map(_userFromFirebaseUser);
  }

  /* 
    Sign in Anonymos 
    Đăng nhập với tư cách người lạ
    Dùng Future bởi vì hàm này có khả năng gây ra lỗi khá cao -> vì vậy phải dùng try/catch
    tuy nhiên nó sẽ được sử dụng trong tương lai
  */
  Future signInAnon() async {
    try {
      /*  Lấy kết quả xác thực từ Auth */
      AuthResult result = await _auth.signInAnonymously();
      /*  Lấy dữ liệu người dùng về */
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /*
    Sign in with Email & Password
  */
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print('Erro in Register ' + e.toString());
      return null;
    }
  }
  /* 
    Register with Email & Password
  */
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email,password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print('Erro in Register ' + e.toString());
      return null;
    }
  }

  /* 
    Sign out 
  */
  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print('Erro Signout: ' + e.toString());
    }
  }
}
