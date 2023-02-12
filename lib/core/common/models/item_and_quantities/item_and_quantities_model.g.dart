// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_and_quantities_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAndQuantitesAdapter extends TypeAdapter<ItemAndQuantites> {
  @override
  final int typeId = 5;

  @override
  ItemAndQuantites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemAndQuantites(
      quantity: fields[0] as int,
      itemName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ItemAndQuantites obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.quantity)
      ..writeByte(1)
      ..write(obj.itemName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAndQuantitesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
