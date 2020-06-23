import 'package:cloud_firestore/cloud_firestore.dart';

class ListManagement {

     final CollectionReference _ref = Firestore.instance.collection("0");
    List<DocumentSnapshot> _todaysSpecial = [];

    List<DocumentSnapshot> getTodaySpecial(){
      return _todaysSpecial;
    }

    void addTodaysSpecial( List<DocumentSnapshot> food) {
      _todaysSpecial.addAll(food); 
    }
  
    getFood() async {
    Query q = _ref.where("Description",isGreaterThan: " " ).orderBy('Description').limit(10);
    QuerySnapshot snapshot = await q.getDocuments(); 
    
  }

  }