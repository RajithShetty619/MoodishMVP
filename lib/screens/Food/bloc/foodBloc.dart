import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';

class FoodBloc extends Bloc<FoodEvent, Map<String, List<FoodListModel>>> {
  @override
  Map<String, List<FoodListModel>> get initialState => {"0":[]};

  @override
  Stream<Map<String, List<FoodListModel>>> mapEventToState(
      FoodEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        Map<String, List<FoodListModel>> newstate = state;
        if (event.food != null) {
          print("addinf");
          newstate["0"].addAll(event.food);
          final _box = Hive.box('foodlist');
          _box.put('0', newstate["0"]);
        }
        yield newstate;
        break;
      case EventType.delete:
        Map<String, List<FoodListModel>> newstate = state;
        newstate[0].removeAt(event.foodIndex);
        yield newstate;
        break;
      default:
        throw Exception("event not found $event");
    }
  }
}
