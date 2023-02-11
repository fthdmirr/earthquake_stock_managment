import 'package:earhquake_stock_managment/app.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/inventory_item_cache_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/report_cache_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/vehicle_cache_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/vehicle_info_cache_manager.dart';
import 'package:earhquake_stock_managment/core/utils/constants/hive/hive_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

final InventoryItemCacheManager itemCacheManager =
    InventoryItemCacheManager(HiveConstants.inventoryItem);
final ReportCacheManager reportCacheManager =
    ReportCacheManager(HiveConstants.report);
final VehicleCacheManager vehicleCacheManager =
    VehicleCacheManager(HiveConstants.vehicle);
final VehicleInfoCacheManager vehicleInfoCacheManager =
    VehicleInfoCacheManager(HiveConstants.vehicleInfo);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();
  runApp(
    const App(),
  );
}

Future<void> _init() async {
  await Hive.initFlutter();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
}
