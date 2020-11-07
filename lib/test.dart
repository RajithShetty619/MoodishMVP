import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:moodish_mvp/screens/Restaurants/restBloc/restBloc.dart';
import 'package:moodish_mvp/screens/Restaurants/restaurantCard/restCardModel.dart';
import 'package:moodish_mvp/screens/Restaurants/restauranthome.dart';
import 'package:http/http.dart';

import 'Services/geolocationRest.dart';
import 'models/restaurantsModel.dart';

class Test extends StatefulWidget {
  final String payload;

  const Test({Key key, this.payload}) : super(key: key);
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  double _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return RestaurantHome();
  }
}
