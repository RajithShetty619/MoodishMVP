import 'package:moodish_mvp/models/foodListModel.dart';

enum EventType { add, delete, like }

class FoodEvent {
  List<FoodListModel> food;
  String listName;
  EventType eventType;
  int index;

  FoodEvent.add(List<FoodListModel> food, String listName) {
    this.eventType = EventType.add;
    this.food = food;
    this.listName = listName;
  }
  FoodEvent.like(int index, String listName) {
    this.eventType = EventType.like;
    this.index = index;
    this.listName = listName;
  }

  FoodEvent.delete(String listName) {
    this.eventType = EventType.delete;
    this.listName = listName;
  }
}
