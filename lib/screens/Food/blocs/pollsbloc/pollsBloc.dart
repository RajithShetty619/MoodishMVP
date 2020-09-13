import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodish_mvp/screens/Food/events/pollsEvent.dart';

class PollBloc extends Bloc<PollEvent, Map<String, List<dynamic>>> {
  @override
  // TODO: implement initialState
  Map<String, List<dynamic>> get initialState => {
        "p": [],
        "choice": [0, 0, 0, 0],
        "fft": [],
        "like": [0, 0, 0, 0, 0],
        "yn": [],
        "yn_choice": [0, 0, 0, 0],
        "tt": [],
        "tt_choice": [0, 0, 0],
      };

  @override
  Stream<Map<String, List<dynamic>>> mapEventToState(PollEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        Map<String, List<dynamic>> newstate = state;
        if (event.polls != null) {
          newstate[event.listName].addAll(event.polls);
        }
        yield newstate;
        break;
      case EventType.replace:
        Map<String, List<dynamic>> newstate = state;
        newstate['choice'][event.choiceIndex] = event.choice;
        yield newstate;
        break;
      case EventType.like:
        Map<String, List<dynamic>> newstate = state;
        newstate['like'][event.likeIndex] = 1;
        yield newstate;
        break;
      default:
        throw Exception("Event not found : ${event}");
    }
  }
}
