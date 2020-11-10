import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';

class FoodBloc extends Bloc<FoodEvent, Map<String, List<FoodListModel>>> {
  FoodBloc()
      : super({
          "0": [],
          "tsp": [],
          "t0": [],
          "t1": [],
          "t2": [],
          "s0": [],
          "s1": [],
          "s2": [],
          "t10M": [],
          "d0": [],
          "d1": [],
          "d2": [],
          "search": [],
          "trend": [],
          "tod": [],
          "craving": [],
          "mood": []
        });
  @override
  Stream<Map<String, List<FoodListModel>>> mapEventToState(
      FoodEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        Map<String, List<FoodListModel>> newstate = state;
        if (event.food != null) {
          newstate[event.listName].addAll(event.food);
        }
        yield newstate;
        break;
      case EventType.like:
        Map<String, List<FoodListModel>> newstate = state;
        if (event.index > -1) {
          newstate[event.listName][event.index].heart =
              !newstate[event.listName][event.index].heart;
        }
        yield newstate;
        break;
      default:
        throw Exception("event not found $event");
    }
  }
}
