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
      deter: fields[1] as String,
      cuisine: fields[2] as String,
      meal_type: fields[3] as String,
      images: fields[4] as String,
      description: fields[5] as String,
      recipe: fields[6] as String,
      ingredients: (fields[7] as List)?.cast<String>(),
      servings: fields[8] as String,
      time: fields[9] as String,
      nutrients: fields[10] as String,
      situation: fields[12] as String,
      taste: fields[11] as String,
      preparation: (fields[13] as List)?.cast<String>(),
      delivery: fields[20] as String,
      calories: fields[14] as String,
      fat: fields[16] as String,
      carbohydrates: fields[17] as String,
      mood: fields[15] as String,
      protein: fields[18] as String,
      restaurants: fields[19] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FoodListModel obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.foodName)
      ..writeByte(1)
      ..write(obj.deter)
      ..writeByte(2)
      ..write(obj.cuisine)
      ..writeByte(3)
      ..write(obj.meal_type)
      ..writeByte(4)
      ..write(obj.images)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.recipe)
      ..writeByte(7)
      ..write(obj.ingredients)
      ..writeByte(8)
      ..write(obj.servings)
      ..writeByte(9)
      ..write(obj.time)
      ..writeByte(10)
      ..write(obj.nutrients)
      ..writeByte(11)
      ..write(obj.taste)
      ..writeByte(12)
      ..write(obj.situation)
      ..writeByte(13)
      ..write(obj.preparation)
      ..writeByte(14)
      ..write(obj.calories)
      ..writeByte(15)
      ..write(obj.mood)
      ..writeByte(16)
      ..write(obj.fat)
      ..writeByte(17)
      ..write(obj.carbohydrates)
      ..writeByte(18)
      ..write(obj.protein)
      ..writeByte(19)
      ..write(obj.restaurants)
      ..writeByte(20)
      ..write(obj.delivery);
  }
}
