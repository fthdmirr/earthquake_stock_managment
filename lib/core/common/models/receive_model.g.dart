// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReceiveModelAdapter extends TypeAdapter<ReceiveModel> {
  @override
  final int typeId = 0;

  @override
  ReceiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReceiveModel(
      fields[0] as Vehicle,
      fields[1] as String,
      fields[2] as ItemType,
      fields[4] as Item,
      fields[3] as int,
      fields[5] as String,
      fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReceiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.vehicle)
      ..writeByte(1)
      ..write(obj.carPlate)
      ..writeByte(2)
      ..write(obj.itemType)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.item)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReceiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 1;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.itemName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemTypeAdapter extends TypeAdapter<ItemType> {
  @override
  final int typeId = 2;

  @override
  ItemType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemType(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ItemType obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.itemType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VehicleAdapter extends TypeAdapter<Vehicle> {
  @override
  final int typeId = 3;

  @override
  Vehicle read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Vehicle.kamyon;
      case 1:
        return Vehicle.kamyonet;
      case 2:
        return Vehicle.tir;
      default:
        return Vehicle.kamyon;
    }
  }

  @override
  void write(BinaryWriter writer, Vehicle obj) {
    switch (obj) {
      case Vehicle.kamyon:
        writer.writeByte(0);
        break;
      case Vehicle.kamyonet:
        writer.writeByte(1);
        break;
      case Vehicle.tir:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
