// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_payment_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoneyPaymentTypeAdapter extends TypeAdapter<MoneyPaymentType> {
  @override
  final int typeId = 2;

  @override
  MoneyPaymentType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MoneyPaymentType.creditCard;
      case 1:
        return MoneyPaymentType.debitCard;
      case 2:
        return MoneyPaymentType.paypal;
      case 3:
        return MoneyPaymentType.skrill;
      case 4:
        return MoneyPaymentType.giftcard;
      case 5:
        return MoneyPaymentType.googlePay;
      case 6:
        return MoneyPaymentType.giroPay;
      case 7:
        return MoneyPaymentType.cash;
      case 8:
        return MoneyPaymentType.other;
      case 9:
        return MoneyPaymentType.notSet;
      default:
        return MoneyPaymentType.creditCard;
    }
  }

  @override
  void write(BinaryWriter writer, MoneyPaymentType obj) {
    switch (obj) {
      case MoneyPaymentType.creditCard:
        writer.writeByte(0);
        break;
      case MoneyPaymentType.debitCard:
        writer.writeByte(1);
        break;
      case MoneyPaymentType.paypal:
        writer.writeByte(2);
        break;
      case MoneyPaymentType.skrill:
        writer.writeByte(3);
        break;
      case MoneyPaymentType.giftcard:
        writer.writeByte(4);
        break;
      case MoneyPaymentType.googlePay:
        writer.writeByte(5);
        break;
      case MoneyPaymentType.giroPay:
        writer.writeByte(6);
        break;
      case MoneyPaymentType.cash:
        writer.writeByte(7);
        break;
      case MoneyPaymentType.other:
        writer.writeByte(8);
        break;
      case MoneyPaymentType.notSet:
        writer.writeByte(9);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoneyPaymentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
