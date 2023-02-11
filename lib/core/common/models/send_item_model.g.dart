// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SendItemModelAdapter extends TypeAdapter<SendItemModel> {
  @override
  final int typeId = 4;

  @override
  SendItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SendItemModel(
      fields[0] as ReceiveModel,
      fields[1] as String,
      fields[2] as String,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SendItemModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.receiveModel)
      ..writeByte(1)
      ..write(obj.exportDate)
      ..writeByte(2)
      ..write(obj.receiveCity)
      ..writeByte(3)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SendItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
