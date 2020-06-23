 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodish_mvp/screens/Food/events/foodEvent.dart'; 
 

class FoodBloc extends Bloc< FoodEvent , List<DocumentSnapshot> >{
  @override 
  List<DocumentSnapshot> get initialState => List<DocumentSnapshot>();

  @override
  Stream<List<DocumentSnapshot>> mapEventToState(FoodEvent event) async* { 
    switch (event.eventType) {
      case EventType.add:
        List<DocumentSnapshot> newstate = List.from(state);
        if(event.food!=null){
          print("addinf");
          newstate.addAll(event.food);
        }
        yield newstate;
        break;
      case EventType.delete:
        
        List<DocumentSnapshot> newstate = List.from(state);
        newstate.removeAt(event.foodIndex);
        yield newstate;
        break;
      default:
        throw Exception("event not found $event");
    }
  }
}
