import 'package:moodish_mvp/models/restaurantsModel.dart';
 

enum EventType{add,delete}

class RestaurantEvent {
  List<RestListModel> restaurant;
  String listName;
  EventType eventType;

  RestaurantEvent.add(List<RestListModel> restaurant , String listName){
    this.eventType = EventType.add;
    this.restaurant = restaurant ; 
    this.listName = listName ;
  }

  RestaurantEvent.delete(String listName){
    this.eventType = EventType.delete;
    this.listName = listName ;
  }
}