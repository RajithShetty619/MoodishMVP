import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart';

class FoodBloc extends Bloc<FoodEvent, List<FoodListModel>> {
  @override
  List<FoodListModel> get initialState => List<FoodListModel>();

  @override
  Stream<List<FoodListModel>> mapEventToState(FoodEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        List<FoodListModel> newstate = List.from(state);
        if (event.food != null) {
          print("addinf");
          newstate.addAll(event.food);
          final _box = Hive.box('foodlist');
          _box.put('0', newstate);
        }
        yield newstate;
        break;
      case EventType.delete:
        List<FoodListModel> newstate = List.from(state);
        newstate.removeAt(event.foodIndex);
        yield newstate;
        break;
      default:
        throw Exception("event not found $event");
    }
  }
}
