import 'package:myshop/auth/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myshop/model/brew.dart';
import 'package:myshop/model/user.dart';

class DataBaseService {
  final String uid;

  DataBaseService({this.uid});

  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('BrewCollection');

  Future<void> updateUserData(String sugar, int strength, String name) async {
    return await brewCollection.doc(uid).set({
      'name':name,
      'sugar':sugar,
      'strength':strength,
    }
    );
  }
 // list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.data()['name'] ?? "",
        strength: doc.data()['strength'] ?? 0,
        sugar: doc.data()['sugar'] ?? "0",
      );
    }).toList();
  }
//    List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
//  //  print(snapshot.size.toString());
//    return snapshot.docs.map((doc){
//      //print(doc.data);
//      return Brew(
//          name: doc.data()['name'] ?? '',
//          strength: doc.data()['strength'] ?? "0",
//          sugar: doc.data()['sugar'] ?? 0,
//      );
//    }).toList();
//  }
  Stream<List<Brew>> get brews{
    return brewCollection.snapshots().map(_brewListFromSnapshot);

  }
  //user data from snapshot
  UserData _userDataFromSnapShot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      strength: snapshot.data()['strength'],
      sugars: snapshot.data()['sugar'],
    );
  }
  Stream<UserData> get userData{
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapShot);
}
}
