

import 'package:cloud_firestore/cloud_firestore.dart';

class BetaCount {

    Future<void> count({ String field}) {
      
    DocumentReference documentReference =
    Firestore.instance.collection("betacount").document("$field");

    return documentReference  
        .setData({
      "count": FieldValue.increment(1) /* atomically increments data by 1 */
    }, merge: true)
        .whenComplete(() => true)
        .catchError((onError) => print(onError));
  }

}