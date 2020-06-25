 
import 'package:moodish_mvp/models/foodListModel.dart';
 

enum EventType{add,delete}

class FoodEvent {
  List<FoodListModel> food;
  int foodIndex;
  EventType eventType;

  FoodEvent.add(List<FoodListModel> food){
    this.eventType = EventType.add;
    this.food = food ;
  }

  FoodEvent.delete(int foodIndex){
    this.eventType = EventType.delete;
    this.foodIndex = foodIndex ;
  }
}