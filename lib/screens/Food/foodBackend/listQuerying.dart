import 'package:cloud_firestore/cloud_firestore.dart';

class ListQuerying {

  final CollectionReference _ref = Firestore.instance.collection("0");

   Future getFood() async {
    Query q = _ref.where("Description",isGreaterThan: " " ).orderBy('Description').limit(10);
    QuerySnapshot snapshot = await q.getDocuments();
    
  }

}