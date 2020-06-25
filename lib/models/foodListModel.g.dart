// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodListModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodListModelAdapter extends TypeAdapter<FoodListModel> {
  @override
  final typeId = 0;

  @override
  FoodListModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodListModel(
      foodName: fields[0] as String,
      foodDeter: fields[1] as String,
      cuisine: fields[2] as String,
      mealType: fields[3] as String,
      images: fields[4] as String,
      description: fields[5] as String,
      recipe: fields[6] as String,
      ingrediants: fields[7] as String,
      servings: fields[8] as String,
      duration: fields[9] as String,
      nutrients: fields[10] as String,
      situation: fields[12] as String,
      taste: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FoodListModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.foodName)
      ..writeByte(1)
      ..write(obj.foodDeter)
      ..writeByte(2)
      ..write(obj.cuisine)
      ..writeByte(3)
      ..write(obj.mealType)
      ..writeByte(4)
      ..write(obj.images)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.recipe)
      ..writeByte(7)
      ..write(obj.ingrediants)
      ..writeByte(8)
      ..write(obj.servings)
      ..writeByte(9)
      ..write(obj.duration)
      ..writeByte(10)
      ..write(obj.nutrients)
      ..writeByte(11)
      ..write(obj.taste)
      ..writeByte(12)
      ..write(obj.situation);
  }
}
