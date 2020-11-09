import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:location/location.dart';
import 'package:moodish_mvp/screens/Food/events/restEvent.dart';
import 'package:moodish_mvp/screens/Restaurants/restBloc/restBloc.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class GeolocationRest {
  Future<void> getRestFromLocation(BuildContext context) async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print("stingy");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("yay");
      } else {
        return [];
      }
    }

    _locationData = await location.getLocation();

    var collectionReference =
        FirebaseFirestore.instance.collection('restaurants');
    double radius_track = 0.5;
    final radius = BehaviorSubject<double>.seeded(radius_track);
    String field = 'g';
    GeoFirePoint center = Geoflutterfire().point(
        latitude: _locationData.latitude, longitude: _locationData.longitude);
    Stream<List<DocumentSnapshot>> stream = radius.switchMap((rad) {
      return Geoflutterfire()
          .collection(collectionRef: collectionReference)
          .within(center: center, radius: rad, field: field, strictMode: true);
    });

    stream.listen((event) async {
      List<RestListModel> list = listfromSnapshot(event);
      print(list.length);
      if (list.length < 9 && radius_track < 10) {
        radius_track = 0.25 + radius_track;
        radius.add(radius_track);
      } else {
        radius.close();
        BlocProvider.of<RestaurantBloc>(context)
            .add(RestaurantEvent.add(list, "near"));
        return null;
      }
    });
  }

  Future<void> getRestFromLocationCuisine(
      BuildContext context, String cuisine_list, String listName) async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print("stingy");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("yay");
      }
    }

    _locationData = await location.getLocation();

    var collectionReference = FirebaseFirestore.instance
        .collection('restaurants')
        .where("cuisine_list", arrayContainsAny: [cuisine_list]);
    double radius_track = 0.5;
    final radius = BehaviorSubject<double>.seeded(radius_track);
    String field = 'g';
    GeoFirePoint center = Geoflutterfire().point(
        latitude: _locationData.latitude, longitude: _locationData.longitude);
    Stream<List<DocumentSnapshot>> stream = radius.switchMap((rad) {
      return Geoflutterfire()
          .collection(collectionRef: collectionReference)
          .within(center: center, radius: rad, field: field, strictMode: true);
    });

    stream.listen((event) async {
      List<RestListModel> list = listfromSnapshot(event);
      if (list.length < 6 && radius_track < 30) {
        radius_track = 0.25 + radius_track;
        radius.add(radius_track);
      } else {
        radius.close();
        BlocProvider.of<RestaurantBloc>(context)
            .add(RestaurantEvent.add(list, listName));
        return null;
      }
    });
  }

  List<RestListModel> listfromSnapshot(List<DocumentSnapshot> snapshot) {
    return snapshot.map((doc) {
      Map<String, dynamic> _docdata = doc.data();
      return RestListModel(
          restaurant_Name: _docdata["Restaurant_Name"] ?? '',
          cuisines: _docdata["Cuisines"] ?? '',
          operational_after_Midnight:
              _docdata["Operational_after_Midnight"] ?? '',
          features: _docdata["Features"] ?? '',
          restaurant_Location: _docdata["Restaurant_Location"] ?? '',
          international_phone_number:
              _docdata["international_phone_number"] ?? '',
          rating: _docdata["rating"].toString() ?? '',
          website: _docdata["website"] ?? '',
          photo_url: _docdata["photo_url"] ?? '',
          reviews: _docdata["reviews"] ?? null,
          restaurant_Type: _docdata["Restaurant_Type"] ?? '',
          sr_no: _docdata["sr_no"] ?? '',
          address: _docdata["address"] ?? '');
    }).toList();
  }
}
