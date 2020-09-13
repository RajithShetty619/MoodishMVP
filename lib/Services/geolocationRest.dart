import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:moodish_mvp/models/restaurantsModel.dart';

class GeolocationRest {
  Future<List<RestListModel>> getRestFromLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    try {
      var data = await get(
          "https://us-central1-moodishtest.cloudfunctions.net/returnRestaurants?lat=${position.latitude}&long=${position.longitude}");
      var info = await json.decode(data.body);
      List<dynamic> send = await json.decode(info["restaurants"]);

      return listfromSnapshot(send);
    } catch (e) {
      var data = await get(
          "https://us-central1-moodishtest.cloudfunctions.net/returnRestaurants?lat=${position.latitude}&long=${position.longitude}");
      var info = await json.decode(data.body);
      List<dynamic> send = await json.decode(info["restaurants"]);
      return listfromSnapshot(send);
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
          sr_no: _docdata["sr_no"] ?? '');
    }).toList();
  }
}
