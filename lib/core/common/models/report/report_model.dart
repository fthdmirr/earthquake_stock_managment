import 'package:earhquake_stock_managment/core/common/models/vehicle_info/vehicle_info_model.dart';
import 'package:earhquake_stock_managment/core/utils/constants/hive/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'report_model.g.dart';

@HiveType(typeId: HiveConstants.reportId)
class Report {
  Report({
    required this.dateTime,
    required this.quantity,

  });
  @HiveField(0)
  final String dateTime;
  @HiveField(1)
  final List<VehicleInfo> quantity;
}
