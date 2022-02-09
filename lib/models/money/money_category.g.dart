// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoneyCategoryAdapter extends TypeAdapter<MoneyCategory> {
  @override
  final int typeId = 4;

  @override
  MoneyCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MoneyCategory.food;
      case 1:
        return MoneyCategory.entertainment;
      case 2:
        return MoneyCategory.saving;
      case 3:
        return MoneyCategory.tax;
      case 4:
        return MoneyCategory.animals;
      case 5:
        return MoneyCategory.salary;
      case 6:
        return MoneyCategory.rent;
      case 7:
        return MoneyCategory.gift;
      case 8:
        return MoneyCategory.medic;
      case 9:
        return MoneyCategory.vacation;
      case 10:
        return MoneyCategory.contracts;
      case 11:
        return MoneyCategory.transport;
      case 12:
        return MoneyCategory.other;
      case 13:
        return MoneyCategory.notSet;
      default:
        return MoneyCategory.food;
    }
  }

  @override
  void write(BinaryWriter writer, MoneyCategory obj) {
    switch (obj) {
      case MoneyCategory.food:
        writer.writeByte(0);
        break;
      case MoneyCategory.entertainment:
        writer.writeByte(1);
        break;
      case MoneyCategory.saving:
        writer.writeByte(2);
        break;
      case MoneyCategory.tax:
        writer.writeByte(3);
        break;
      case MoneyCategory.animals:
        writer.writeByte(4);
        break;
      case MoneyCategory.salary:
        writer.writeByte(5);
        break;
      case MoneyCategory.rent:
        writer.writeByte(6);
        break;
      case MoneyCategory.gift:
        writer.writeByte(7);
        break;
      case MoneyCategory.medic:
        writer.writeByte(8);
        break;
      case MoneyCategory.vacation:
        writer.writeByte(9);
        break;
      case MoneyCategory.contracts:
        writer.writeByte(10);
        break;
      case MoneyCategory.transport:
        writer.writeByte(11);
        break;
      case MoneyCategory.other:
        writer.writeByte(12);
        break;
      case MoneyCategory.notSet:
        writer.writeByte(13);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoneyCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
