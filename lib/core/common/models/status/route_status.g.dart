// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RouteStatusAdapter extends TypeAdapter<RouteStatus> {
  @override
  final int typeId = 3;

  @override
  RouteStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RouteStatus.came;
      case 1:
        return RouteStatus.sending;
      default:
        return RouteStatus.came;
    }
  }

  @override
  void write(BinaryWriter writer, RouteStatus obj) {
    switch (obj) {
      case RouteStatus.came:
        writer.writeByte(0);
        break;
      case RouteStatus.sending:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
