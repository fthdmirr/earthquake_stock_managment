import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/i_cache_managar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ItemCacheManager extends ICacheManager<Item> {
  ItemCacheManager(String key) : super(key);

  @override
  Future<void> addItems(List<Item> values) async {
    await box?.addAll(values);
  }

  @override
  Item? getItem(String key) {
    return box?.get(key);
  }

  @override
  Future<void> putValue(Item value) async {
    await box?.put(key, value);
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  List<Item>? getValues() {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ItemAdapter());
      Hive.registerAdapter(ItemAdapter());
      Hive.registerAdapter(ItemAdapter());
      Hive.registerAdapter(VehicleAdapter());
    }
  }
}
