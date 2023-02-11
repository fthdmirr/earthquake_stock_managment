import 'package:earhquake_stock_managment/core/utils/constants/hive/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'vehicle_model.g.dart';

@HiveType(typeId: HiveConstants.vehicleId)
class Vehicle {
  Vehicle({
    required this.vehicleType,
    required this.driverName,
    required this.driverPhone,
    required this.plate,
  });
  @HiveField(0)
  final String vehicleType;
  @HiveField(1)
  final String driverName;
  @HiveField(2)
  final String driverPhone;
  @HiveField(3)
  final String plate;
}
