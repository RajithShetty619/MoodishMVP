import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moodish_mvp/Services/storage.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/name.dart';

class DatabaseService {
  
  final CollectionReference userName =
      Firestore.instance.collection('Username');

  Future<void> updateUserData({String uid, String email, String name}) async {
    return await userName.document(uid).setData({
      'name': name,
    });
  }
/* 
  Future<void> setPreference() async {
    return await userName.document
  } */

  List<Name> _nameListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Name(name: doc.data['name'] ?? '');
    }).toList();
  }

 
//  List<Name> _nameListFromSnapshot(QuerySnapshot snapshot) {
//    return snapshot.documents.map((doc) {
//      return Name(name: doc.data['name'] ?? '');
//    }).toList();
//  }
//
//  Stream<List<Name>> get names {
//    return userName.snapshots().map(_nameListFromSnapshot);
//  }

  Future<List<FoodListModel>> listFromSnapshot(QuerySnapshot snapshot) async { 
    return Future.wait(snapshot.documents.map((doc) async {

      Map<String, dynamic> _docData = doc.data;  
      String _url = await Storage().getUrl(_docData["image"]);
      return FoodListModel(
        foodName: _docData["food_item"] ?? '',
        foodDeter: _docData["deter"] ?? '',
        cuisine: _docData["cuisine"] ?? '',
        mealType: _docData["mealType"] ?? '',
        images: _url ?? '',
        description: _docData["description"] ?? '',
        recipe: _docData["preperation"] ?? '',
        ingrediants: _docData["ingredients"] ?? '',
        servings: _docData["serving"] ?? '',
        duration: _docData["time"] ?? '',
        nutrients: _docData["nutrients"] ?? '',
        taste: _docData["taste"] ?? '',
        situation: _docData["situation"] ?? '',
        preperation: _docData["preperation"] ?? ''
      );
    }).toList());
  }
}
