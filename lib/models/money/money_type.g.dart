// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoneyTypeAdapter extends TypeAdapter<MoneyType> {
  @override
  final int typeId = 1;

  @override
  MoneyType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MoneyType.incoming;
      case 1:
        return MoneyType.expenses;
      case 2:
        return MoneyType.notSet;
      default:
        return MoneyType.incoming;
    }
  }

  @override
  void write(BinaryWriter writer, MoneyType obj) {
    switch (obj) {
      case MoneyType.incoming:
        writer.writeByte(0);
        break;
      case MoneyType.expenses:
        writer.writeByte(1);
        break;
      case MoneyType.notSet:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoneyTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
