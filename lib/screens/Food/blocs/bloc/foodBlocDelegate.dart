import 'package:flutter_bloc/flutter_bloc.dart';

class FoodBlocDelegate extends BlocObserver {
  @override
  void onEvent(Cubit bloc, Object event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Cubit bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print(transition.currentState);
    print(transition.nextState);
  }

  @override
  void onError(Cubit bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    print(error);
  }
}
