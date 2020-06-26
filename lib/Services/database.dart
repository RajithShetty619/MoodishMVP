import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/name.dart';

class DatabaseService { 

  

  final String uid;
  DatabaseService({ this.uid });
  final CollectionReference userName = Firestore.instance.collection('Username');
 
  Future<void> updateUserData(String name) async {
    return await userName.document(uid).setData({
      'name': name,
    });
  }

 
  List<Name> _nameListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Name(name: doc.data['name'] ?? '');
    }).toList();
  }

  Stream<List<Name>> get names {
    return userName.snapshots().map(_nameListFromSnapshot);
  }

  List<FoodListModel> listFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      Map<String, dynamic> _docData =doc.data; 
      return FoodListModel(foodName: _docData["Food Name"] ?? '',foodDeter: _docData["Food deter"] ?? '',cuisine: _docData["Cuisine"] ?? '',mealType: _docData["Meal type"] ?? '',
                        images: _docData["Images"] ?? '',description: _docData["Description"] ?? '',recipe: _docData["Recipe"] ?? '',ingrediants: _docData["Ingrediants"] ?? '',
                        servings: _docData["Servings"] ?? '',duration: _docData["Duration"] ?? '',nutrients: _docData["Nutrients"] ?? '',taste: _docData["Taste"] ?? '',
                        situation: _docData["Situation"] ?? '', );
    }).toList();
  }

}
 
