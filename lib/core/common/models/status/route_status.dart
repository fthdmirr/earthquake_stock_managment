import 'package:earhquake_stock_managment/core/utils/constants/hive/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'route_status.g.dart';

@HiveType(typeId: HiveConstants.vehicleId)
enum RouteStatus {
  @HiveField(0)
  came,
  @HiveField(1)
  sending,
}
