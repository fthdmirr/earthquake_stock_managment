import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/common/models/status/route_status.dart';
import 'package:earhquake_stock_managment/core/utils/constants/hive/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../vehicle/vehicle_model.dart';

part 'vehicle_info_model.g.dart';

@HiveType(typeId: HiveConstants.vehicleInfoId)
class VehicleInfo {
  VehicleInfo({
    required this.destinationCity,
    required this.vehicle,
    required this.routeStatus,
    required this.inventoryItems,
  });
  @HiveField(0)
  final String destinationCity;
  @HiveField(1)
  final Vehicle vehicle;
  @HiveField(2)
  final RouteStatus routeStatus;
  @HiveField(3)
  final List<InventoryItem> inventoryItems;
}
