// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_cycle.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoneyCycleAdapter extends TypeAdapter<MoneyCycle> {
  @override
  final int typeId = 3;

  @override
  MoneyCycle read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MoneyCycle.daily;
      case 1:
        return MoneyCycle.weekly;
      case 2:
        return MoneyCycle.monthly;
      case 3:
        return MoneyCycle.quarterly;
      case 4:
        return MoneyCycle.halfYearly;
      case 5:
        return MoneyCycle.yearly;
      case 6:
        return MoneyCycle.notSet;
      default:
        return MoneyCycle.daily;
    }
  }

  @override
  void write(BinaryWriter writer, MoneyCycle obj) {
    switch (obj) {
      case MoneyCycle.daily:
        writer.writeByte(0);
        break;
      case MoneyCycle.weekly:
        writer.writeByte(1);
        break;
      case MoneyCycle.monthly:
        writer.writeByte(2);
        break;
      case MoneyCycle.quarterly:
        writer.writeByte(3);
        break;
      case MoneyCycle.halfYearly:
        writer.writeByte(4);
        break;
      case MoneyCycle.yearly:
        writer.writeByte(5);
        break;
      case MoneyCycle.notSet:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoneyCycleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
