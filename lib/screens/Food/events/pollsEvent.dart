enum EventType{add,replace}

class PollEvent {
  List<dynamic> polls;
  String listName;
  int choiceIndex;
  int choice;
  EventType eventType;

  PollEvent.add(List<dynamic> polls , String listName){
    this.eventType = EventType.add;
    this.polls = polls ; 
    this.listName = listName ;
  }

  PollEvent.replace(int choiceIndex,int choice){
    this.eventType = EventType.replace;
    this.choiceIndex = choiceIndex ;
    this.choice = choice ;
  }
}