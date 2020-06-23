import 'package:cloud_firestore/cloud_firestore.dart';
 

enum EventType{add,delete}

class FoodEvent {
  List<DocumentSnapshot> food;
  int foodIndex;
  EventType eventType;

  FoodEvent.add(List<DocumentSnapshot> food){
    this.eventType = EventType.add;
    this.food = food ;
  }

  FoodEvent.delete(int foodIndex){
    this.eventType = EventType.delete;
    this.foodIndex = foodIndex ;
  }
}