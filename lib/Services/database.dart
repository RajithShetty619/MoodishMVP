import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moodish_mvp/models/name.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference userName =
      Firestore.instance.collection('Username');

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
}
