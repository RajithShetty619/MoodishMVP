import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';

class FoodBloc extends Bloc<FoodEvent, Map<String, List<FoodListModel>>> {
  @override
  Map<String, List<FoodListModel>> get initialState => {
        "0": [],
        "tsp": [],
        "every_T": [],
        "every_S": [],
        "food_T": [],
        "food_S": [],
      };

  @override
  Stream<Map<String, List<FoodListModel>>> mapEventToState(
      FoodEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        Map<String, List<FoodListModel>> newstate = state;
        if (event.food != null) {
          print("addinf");
          final List<FoodListModel>  _food = event.food;
          newstate[event.listName].addAll( _food);
        }
        yield newstate;
        break;
      default:
        throw Exception("event not found $event");
    }
  }
}
