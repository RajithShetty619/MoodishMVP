// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurantsModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RestListModelAdapter extends TypeAdapter<RestListModel> {
  @override
  final int typeId = 2;

  @override
  RestListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RestListModel(
      restname: fields[0] as String,
      restcuisine: fields[1] as String,
      costForTwo: fields[2] as String,
      operationalhrs: fields[3] as String,
      features: fields[4] as String,
      homeDelivery: fields[5] as String,
      addnoutlet: fields[6] as String,
      location: fields[7] as String,
      rating: fields[8] as String,
      catRating: fields[9] as String,
      deliverytime: fields[10] as String,
      restlocation: fields[11] as String,
      votes: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RestListModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.restname)
      ..writeByte(1)
      ..write(obj.restcuisine)
      ..writeByte(2)
      ..write(obj.costForTwo)
      ..writeByte(3)
      ..write(obj.operationalhrs)
      ..writeByte(4)
      ..write(obj.features)
      ..writeByte(5)
      ..write(obj.homeDelivery)
      ..writeByte(6)
      ..write(obj.addnoutlet)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.rating)
      ..writeByte(9)
      ..write(obj.catRating)
      ..writeByte(10)
      ..write(obj.deliverytime)
      ..writeByte(11)
      ..write(obj.restlocation)
      ..writeByte(12)
      ..write(obj.votes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
