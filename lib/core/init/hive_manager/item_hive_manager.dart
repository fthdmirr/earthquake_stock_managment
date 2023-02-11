import 'package:hive_flutter/hive_flutter.dart';

import '../../common/models/receive_model.dart';

class ItemCacheManager {
  ItemCacheManager(this.key) {
    init();
  }

  final String key;
  Box<Item>? _box;

  Box<Item>? get box => _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> addItems(List<Item> values) async {
    await box?.addAll(values);
  }

  Item? getItem(String key) {
    return box?.get(key);
  }

  Future<void> addValue(Item value) async {
    await box?.add(value);
  }

  Future<void> putValue(Item value) async {
    await box?.put(key, value);
  }

  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  List<Item>? getValues() {
    return box?.values.toList();
  }

  void registerAdapters() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ItemAdapter());
    }
  }
}
