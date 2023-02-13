// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleInfoAdapter extends TypeAdapter<VehicleInfo> {
  @override
  final int typeId = 3;

  @override
  VehicleInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehicleInfo(
      destinationCity: fields[0] as String,
      vehicle: fields[1] as Vehicle,
      routeStatus: fields[2] as RouteStatus,
      inventoryItems: (fields[3] as List).cast<InventoryItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, VehicleInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.destinationCity)
      ..writeByte(1)
      ..write(obj.vehicle)
      ..writeByte(2)
      ..write(obj.routeStatus)
      ..writeByte(3)
      ..write(obj.inventoryItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
