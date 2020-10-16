import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:moodish_mvp/screens/Food/events/restEvent.dart';

class RestaurantBloc
    extends Bloc<RestaurantEvent, Map<String, List<RestListModel>>> {
  RestaurantBloc() : super({"r1": [], "r2": []});

  Stream<Map<String, List<RestListModel>>> mapEventToState(
      RestaurantEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        Map<String, List<RestListModel>> newstate = state;
        if (event.restaurant != null) {
          newstate[event.listName].addAll(event.restaurant);
        }
        yield newstate;
        break;
      default:
        throw Exception('event not found $event');
    }
  }
}
