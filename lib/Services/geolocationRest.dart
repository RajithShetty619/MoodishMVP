import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';
import 'package:location/location.dart';

class GeolocationRest {
  Future<List<RestListModel>> getRestFromLocation() async {
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

    // final position = await Geolocator().getCurrentPosition();
    // print(position);
    try {
      var data = await get(
          "https://us-central1-moodishtest.cloudfunctions.net/returnRestaurants?lat=${_locationData.latitude}&long=${_locationData.longitude}");
      // if (data.body == "Error: could not handle the request") throw Error();
      var info = await json.decode(data.body);
      print(info);
      List<dynamic> send = await json.decode(info["restaurants"]);

      return listfromSnapshot(send);
    } catch (e) {
      try {
        print(e.toString());
        var data = await get(
            "https://us-central1-moodishtest.cloudfunctions.net/returnRestaurants?lat=${_locationData.latitude}&long=${_locationData.longitude}");
        // if (data.body == "Error: could not handle the request") return [];
        var info = await json.decode(data.body);
        print(info);
        List<dynamic> send = await json.decode(info["restaurants"]);
        return listfromSnapshot(send);
      } catch (e) {
        print(e);
        return [];
      }
    }
  }

  List<RestListModel> listfromSnapshot(List<dynamic> snapshot) {
    return snapshot.map((doc) {
      Map<String, dynamic> _docdata = doc;
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
