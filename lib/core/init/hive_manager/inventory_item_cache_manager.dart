import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InventoryItemCacheManager {
  InventoryItemCacheManager(this.key) {
    init();
  }

  final String key;
  Box<InventoryItem>? _box;

  Box<InventoryItem>? get box => _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> addItems(List<InventoryItem> values) async {
    await box?.addAll(values);
  }

  InventoryItem? getItem(String key) {
    return box?.get(key);
  }

  Future<void> addValue(InventoryItem value) async {
    await box?.add(value);
  }

  Future<void> putValue(InventoryItem value) async {
    await box?.put(key, value);
  }

  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  List<InventoryItem> getValues() {
    return box?.values.toList() ?? [];
  }

  void registerAdapters() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(InventoryItemAdapter());
    }
  }
}
