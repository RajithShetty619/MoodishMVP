import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:moodish_mvp/Services/authenticate.dart';
import 'package:moodish_mvp/models/foodListModel.dart';
import 'package:moodish_mvp/models/pollsModel.dart';
import 'package:moodish_mvp/models/user.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBloc.dart';
import 'package:moodish_mvp/screens/Food/blocs/bloc/foodBlocDelegate.dart';
import 'package:moodish_mvp/screens/Food/blocs/pollsbloc/pollsBloc.dart';
import 'package:moodish_mvp/screens/Food/blocs/pollsbloc/pollsBlocDelegate.dart';
import 'package:moodish_mvp/screens/Food/pages/foodFeed.dart';
import 'package:moodish_mvp/screens/wrapper.dart';
import 'package:moodish_mvp/test.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  BlocSupervisor.delegate = FoodBlocDelegate();
  BlocSupervisor.delegate = PollBlocDelegate();
  await Hive.initFlutter(); 
  Hive.registerAdapter<FoodListModel>(FoodListModelAdapter());
  Hive.registerAdapter<PollsModel>(PollsModelAdapter());
  runApp(MaterialApp(  
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}
GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodBloc>(create: (context)=> FoodBloc(),
        ),
        BlocProvider<PollBloc>(create: (context)=> PollBloc(), 
        ),
      ],
      child: StreamProvider<User>.value(
        value: Authenticate().onAuthChanged,
        child: MaterialApp( 
          debugShowCheckedModeBanner: false,
          title: 'Moodish',
          home: Wrapper(), 
        ), 
      ),
    );
    
     
  }
}
