import 'app.dart';
import 'core/init/hive_manager/item_hive_manager.dart';
import 'core/init/hive_manager/item_type_hive_manager.dart';
import 'core/init/hive_manager/receive_hive_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

final ItemCacheManager itemCacheManager = ItemCacheManager('items');
final ItemTypeCacheManager itemTypeCacheManager =
    ItemTypeCacheManager('itemType');
final ReceiveCacheManager receiveCacheManager = ReceiveCacheManager('receive');

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
