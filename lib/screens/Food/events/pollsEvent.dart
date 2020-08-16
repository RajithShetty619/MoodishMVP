enum EventType { add, replace, like }

class PollEvent {
  List<dynamic> polls;
  String listName;
  int choiceIndex;
  int choice;
  int likeIndex;
  EventType eventType;

  PollEvent.add(List<dynamic> polls, String listName) {
    this.eventType = EventType.add;
    this.polls = polls;
    this.listName = listName;
  }

  PollEvent.replace(int choiceIndex, int choice) {
    this.eventType = EventType.replace;
    this.choiceIndex = choiceIndex;
    this.choice = choice;
  }

  PollEvent.like(int index) {
    this.eventType = EventType.like;
    this.likeIndex = index;
  }
}
