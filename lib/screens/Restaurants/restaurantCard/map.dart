import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}






//import 'package:flutter/material.dart';
//import 'package:flutter_map/flutter_map.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:latlong/latlong.dart';
//class Maps extends StatefulWidget {
//  @override
//  _MapsState createState() => _MapsState();
//}
//
//class _MapsState extends State<Maps> {
//  Geolocator geolocator = Geolocator();
//  Position userLocation;
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _getCurrentLocation().then((position) {
//      userLocation = position;
//    });
//  }
//  MapController controller = MapController();
//  _getCurrentLocation()async{
//    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//    print(position);
//  }
//
//  buildMap(){
//    _getCurrentLocation().then((response){
//      if(response.isSuccessful)
//        response.listen((value){
//          controller.move(new LatLng(value.location.latitude,value.location.longitude) , 15.0);
//        });
//    });
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: FlutterMap(
//        mapController: controller,
//        options: MapOptions(center: LatLng(userLocation.latitude,userLocation.longitude),minZoom: 5.0),
//        layers: [
//          TileLayerOptions(
//            urlTemplate: "https://api.mapbox.com/v4/"
//              "{id}/{z}/{x}/{y}@2x.png?access_token={pk.eyJ1IjoidmFydW5zaW5naDEzMDgiLCJhIjoiY2tjdmtkaDg5MDU0ZzJwbXN3Y29kZ2Y3NiJ9.kOi_lhwGOkN-rncYudXpJA}",
//            additionalOptions: {
//              'accessToken':'pk.eyJ1IjoidmFydW5zaW5naDEzMDgiLCJhIjoiY2tjdmtkaDg5MDU0ZzJwbXN3Y29kZ2Y3NiJ9.kOi_lhwGOkN-rncYudXpJA',
//              'id':'maps.street'
//            }
//          ),
//          MarkerLayerOptions(
//            markers: [
//              Marker(
//                width: double.maxFinite,
//                height: 400,
//                point: LatLng(userLocation.latitude,userLocation.longitude)
//              )
//            ]
//          )
//        ],
//      ),
//    );
//  }
//}
