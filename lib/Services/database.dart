import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moodish_mvp/Services/storage.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/name.dart';

class DatabaseService {  

  final String uid;
  DatabaseService({ this.uid });
  final CollectionReference userName = Firestore.instance.collection('Username');
 
  Future<void> updateUserData(String uid,String email,String name) async {
    return await userName.document(uid).setData({
      'name': name,
      'email': email,
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

  Future<List<FoodListModel>> listFromSnapshot(QuerySnapshot snapshot) async {
    return Future.wait(snapshot.documents.map((doc) async{
      Map<String, dynamic> _docData =doc.data; 
      String _url = await Storage().getUrl(_docData["Images"]);
      return FoodListModel(foodName: _docData["Food Name"] ?? '',foodDeter: _docData["Food deter"] ?? '',cuisine: _docData["Cuisine"] ?? '',mealType: _docData["Meal type"] ?? '',
                        images: _url ?? '',description: _docData["Description"] ?? '',recipe: _docData["Recipe"] ?? '',ingrediants: _docData["Ingrediants"] ?? '',
                        servings: _docData["Servings"] ?? '',duration: _docData["Duration"] ?? '',nutrients: _docData["Nutrients"] ?? '',taste: _docData["Taste"] ?? '',
                        situation: _docData["Situation"] ?? '', );
    }).toList());
  }

}
 
