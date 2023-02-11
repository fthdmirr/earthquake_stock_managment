import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/i_cache_managar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ItemTypeCacheManager extends ICacheManager<ItemType> {
  ItemTypeCacheManager(String key) : super(key);

  @override
  Future<void> addItems(List<ItemType> values) async {
    await box?.addAll(values);
  }

  @override
  ItemType? getItem(String key) {
    return box?.get(key);
  }

  @override
  Future<void> putValue(ItemType value) async {
    await box?.put(key, value);
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  List<ItemType>? getValues() {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(2)) {
 Hive.registerAdapter(ItemTypeAdapter());
    }
  }
}
