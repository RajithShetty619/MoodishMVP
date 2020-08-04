import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodish_mvp/models/pollsModel.dart';
import 'package:moodish_mvp/screens/Food/events/pollsEvent.dart';

class PollBloc extends Bloc<PollEvent, Map<String, List<PollsModel>>>{
  @override
  // TODO: implement initialState
  Map<String, List<PollsModel>> get initialState => {
    "p": [],
  };

  @override
  Stream<Map<String, List<PollsModel>>> mapEventToState(PollEvent event) async* {
    switch(event.eventType){
      case EventType.add:
     Map<String, List<PollsModel>> newstate = state;
      if(event.polls != null) {
        print('polllllllll');
        print(event.polls);
        newstate[event.listName].addAll(event.polls);
        print(newstate);
      }
      yield newstate;
      break;
      default:
      throw Exception("Event not found : ${event}");
    }
  }

}