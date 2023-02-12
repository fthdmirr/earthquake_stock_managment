import 'package:earhquake_stock_managment/app.dart';
import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/common/models/status/route_status.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle/vehicle_model.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle_info/vehicle_info_model.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/inventory_item_cache_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/report_cache_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/vehicle_cache_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/vehicle_info_cache_manager.dart';
import 'package:earhquake_stock_managment/core/utils/constants/hive/hive_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

late final InventoryItemCacheManager itemCacheManager;

late final ReportCacheManager reportCacheManager;
late final VehicleCacheManager vehicleCacheManager;
late final VehicleInfoCacheManager vehicleInfoCacheManager;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();
  runApp(
    const App(),
  );
}

Future<void> _init() async {
  await Hive.initFlutter();

  Hive.registerAdapter(InventoryItemAdapter());
  Hive.registerAdapter(VehicleAdapter());
  Hive.registerAdapter(VehicleInfoAdapter());
  Hive.registerAdapter(ReportAdapter());
  Hive.registerAdapter(RouteStatusAdapter());

  itemCacheManager = InventoryItemCacheManager(HiveConstants.inventoryItem);
  reportCacheManager = ReportCacheManager(HiveConstants.report);
  vehicleCacheManager = VehicleCacheManager(HiveConstants.vehicle);
  vehicleInfoCacheManager = VehicleInfoCacheManager(HiveConstants.vehicleInfo);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
}
