
import 'package:flutter_bloc/flutter_bloc.dart';

class PollBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
    print(event);
    print("0000000000000000000000000000000000");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print(transition.currentState);
    print(transition.nextState);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
    print(error);
  }
}