import 'dart:ffi';

import 'package:hive/hive.dart';

class RestListModel {
  final String restaurant_Name;
  final String cuisines;
  final String features;
  final String restaurant_Type;
  final String operational_after_Midnight;
  final String restaurant_Location;
  final String rating;
  final String international_phone_number;
  final String price_level;
  final String website;
  final String photo_url;
  final List<dynamic> reviews;
  final String sr_no;
  final String address;

  RestListModel(
      {this.restaurant_Name,
      this.cuisines,
      this.features,
      this.restaurant_Type,
      this.operational_after_Midnight,
      this.restaurant_Location,
      this.rating,
      this.international_phone_number,
      this.price_level,
      this.website,
      this.photo_url,
      this.sr_no,
      this.reviews,
      this.address});
  /* 
   AFTER ANY CHANGES OR ANY ERROR IN THIS FILE, RUN THIS COMMAND
run command: flutter packages pub run build_runner build --delete-conflicting-outputs
  {
      "Additional_outlet_count": 1,
      "Cost_for_two(Rs.)": 700,
      "Cuisines": "Biryani, Desserts, North Indian, Mughlai, Rolls",
      "Features": "Brilliant Biryanis",
      "Home_Delivery": "TRUE",
      "Operational_hours": "12noon – 12midnight (Mon-Thu),12noon – 1am...",
        
      "Restaurant_Type": "nan",
      "Delivery_Time(mins)": 55,
      "Rating_Category": "Very Good",
      "Operational_after_Midnight": "TRUE",
      "Cuisine_count": 5,
      "Restaurant_Location": "4 Bungalows",
      "Restaurant_Name": "Goila Butter Chicken",
      "Rating": 4.1,
      "Votes": 751,
      "Longitude": "",
      "Latitude": "",
      "geography": "",
      "Email": "",
      "Phone_no": "",
      "done": 0,
      "who added?": ""
    }, */
}
