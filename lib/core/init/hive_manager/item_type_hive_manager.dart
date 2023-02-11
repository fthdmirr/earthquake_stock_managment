import '../../common/models/receive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ItemTypeCacheManager {
  ItemTypeCacheManager(this.key) {
    init();
  }

  final String key;
  Box<ItemType>? _box;

  Box<ItemType>? get box => _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> addItems(List<ItemType> values) async {
    await box?.addAll(values);
  }

  ItemType? getItem(String key) {
    return box?.get(key);
  }

  Future<void> addValue(ItemType value) async {
    await box?.add(value);
  }

  // Future<void> putValue(ItemType value) async {
  //   await box?.put(key, value);
  // }

  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  List<ItemType>? getValues() {
    return box?.values.toList();
  }

  void registerAdapters() {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(ItemTypeAdapter());
    }
  }
}
