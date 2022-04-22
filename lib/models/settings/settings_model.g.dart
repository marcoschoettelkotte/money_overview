// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsModelAdapter extends TypeAdapter<SettingsModel> {
  @override
  final int typeId = 10;

  @override
  SettingsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsModel(
      username: fields[0] as String,
      imageBase64: fields[1] as String,
      defaultCalendar: fields[2] as MoneyCycle,
      defaultCurrency: fields[3] as String,
      isDarkMode: fields[4] as bool,
      languageCode: fields[5] as String,
      defaultDateMonth: fields[6] as String?,
      isCurrentDateMonth: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.imageBase64)
      ..writeByte(2)
      ..write(obj.defaultCalendar)
      ..writeByte(3)
      ..write(obj.defaultCurrency)
      ..writeByte(4)
      ..write(obj.isDarkMode)
      ..writeByte(5)
      ..write(obj.languageCode)
      ..writeByte(6)
      ..write(obj.defaultDateMonth)
      ..writeByte(7)
      ..write(obj.isCurrentDateMonth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
