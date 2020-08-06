// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollsModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PollsModelAdapter extends TypeAdapter<PollsModel> {
  @override
  final int typeId = 1;

  @override
  PollsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PollsModel(
      question: fields[0] as String,
      A: fields[1] as String,
      B: fields[2] as String,
      C: fields[3] as String,
      D: fields[4] as String,
      sr_no: fields[5] as String,
      aLike: fields[6] as int,
      bLike: fields[7] as int,
      cLike: fields[8] as int,
      dLike: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PollsModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.A)
      ..writeByte(2)
      ..write(obj.B)
      ..writeByte(3)
      ..write(obj.C)
      ..writeByte(4)
      ..write(obj.D)
      ..writeByte(5)
      ..write(obj.sr_no)
      ..writeByte(6)
      ..write(obj.aLike)
      ..writeByte(7)
      ..write(obj.bLike)
      ..writeByte(8)
      ..write(obj.cLike)
      ..writeByte(9)
      ..write(obj.dLike);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PollsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
