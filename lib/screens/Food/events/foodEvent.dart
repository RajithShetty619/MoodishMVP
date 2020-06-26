 
import 'package:moodish_mvp/models/foodListModel.dart';
 

enum EventType{add,delete}

class FoodEvent {
  List<FoodListModel> food;
  String listName;
  EventType eventType;

  FoodEvent.add(List<FoodListModel> food , String listName){
    this.eventType = EventType.add;
    this.food = food ; 
    this.listName = listName ;
  }

  FoodEvent.delete(String listName){
    this.eventType = EventType.delete;
    this.listName = listName ;
  }
}