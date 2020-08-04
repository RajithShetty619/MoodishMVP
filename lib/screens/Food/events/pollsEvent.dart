

import 'package:moodish_mvp/models/pollsModel.dart';

enum EventType{add,delete}

class PollEvent {
  List<PollsModel> polls;
  String listName;
  EventType eventType;

  PollEvent.add(List<PollsModel> polls , String listName){
    this.eventType = EventType.add;
    this.polls = polls ; 
    this.listName = listName ;
  }

  PollEvent.delete(String listName){
    this.eventType = EventType.delete;
    this.listName = listName ;
  }
}