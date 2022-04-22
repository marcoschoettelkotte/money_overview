// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinanceModelAdapter extends TypeAdapter<FinanceModel> {
  @override
  final int typeId = 0;

  @override
  FinanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinanceModel(
      id: fields[0] as String,
      title: fields[1] as String,
      comment: fields[2] as String,
      money: fields[3] as double,
      currency: fields[4] as String,
      type: fields[5] as MoneyType,
      paymentType: fields[6] as MoneyPaymentType,
      category: fields[7] as MoneyCategory,
      cycle: fields[8] as MoneyCycle,
      isActive: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FinanceModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.comment)
      ..writeByte(3)
      ..write(obj.money)
      ..writeByte(4)
      ..write(obj.currency)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.paymentType)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.cycle)
      ..writeByte(9)
      ..write(obj.isActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
