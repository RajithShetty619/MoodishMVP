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
      hrs: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RestListModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.restname)
      ..writeByte(1)
      ..write(obj.restcuisine)
      ..writeByte(3)
      ..write(obj.hrs);
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
