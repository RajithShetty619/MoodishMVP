import 'package:cloud_firestore/cloud_firestore.dart';

class BetaCount {
  count({String field}) {
    DocumentReference documentReference =
        Firestore.instance.collection("betacount").document("$field");

    documentReference.setData({
      "count": FieldValue.increment(1) /* atomically increments data by 1 */
    }, merge: true).catchError((onError) => print(onError));
  }
}
