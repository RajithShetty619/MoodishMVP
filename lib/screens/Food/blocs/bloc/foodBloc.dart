import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';

class FoodBloc extends Bloc<FoodEvent, Map<String, List<FoodListModel>>> {
  @override
  Map<String, List<FoodListModel>> get initialState => {
        "0": [],
        "tsp": [],
        "t0": [],
        "t1": [],
        "t2": [],
        "s0": [],
        "s1": [],
        "s2": [],
        "t10M": [],
        "search": []
      };

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
      default:
        throw Exception("event not found $event");
    }
  }
}
