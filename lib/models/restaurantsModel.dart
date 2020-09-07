import 'package:hive/hive.dart';

part 'restaurantsModel.g.dart';

@HiveType(typeId: 2)
class RestListModel {
  @HiveField(0)
  final String restname;
  @HiveField(1)
  final String restcuisine;
  @HiveField(2)
  final String costForTwo;
  @HiveField(3)
  final String hrs;
  @HiveField(4)
  final String features;
  @HiveField(5)
  final String homeDelivery;
  @HiveField(6)
  final String addnoutlet;
  @HiveField(7)
  final String location;
  @HiveField(8)
  final String rating;
  @HiveField(9)
  final String avgRating;

  RestListModel({
    this.restname,
    this.restcuisine,
    this.costForTwo,
    this.hrs,
    this.features,
    this.homeDelivery,
    this.addnoutlet,
    this.location,
    this.rating,
    this.avgRating,
  });
  /* 
   AFTER ANY CHANGES RUN THIS COMMANDS OR ANY ERROR IN THIS FILE
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
