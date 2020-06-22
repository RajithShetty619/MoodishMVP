import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseQuery {

  final CollectionReference _reference = Firestore.instance.collection('0');

  Stream<List<DocumentSnapshot>> get foodQuery {
    return 
    _reference
      .where("cuisine", isEqualTo: 'indian')
      .limit(10)
      .snapshots()
      .map((QuerySnapshot snapshot){
        return snapshot.documents.toList();
      });
      
  } 

}