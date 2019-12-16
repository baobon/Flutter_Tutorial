import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/models/brew.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

  // Collection Reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');
  
  // Gọi chức năng này khi người dùng mới đăng ký
  Future updateUserData(String sugars, String name, int strength) async 
  {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // Brew list lấy - tách dữ liệu ra từ Snapshot
  List<Brew> _breslistFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc)
    {
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['surgars'] ?? '0'
      );
    }).toList();
  }


  // Tạo một luồng Stream để theo dõi và lắng nghe cơ sở dữ liệu về
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().
       map(_breslistFromSnapshot);
  }

}