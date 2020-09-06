import 'package:hive/hive.dart';

part 'restaurantsModel.g.dart';
@HiveType(typeId: 2)
class RestListModel{
  @HiveField(0)
  final String restname;
  @HiveField(1)
  final String restcuisine;
  @HiveField(3)
  final String hrs;

  RestListModel(
    {
      this.restname,
      this.restcuisine,
      this.hrs,
    }
  );
}