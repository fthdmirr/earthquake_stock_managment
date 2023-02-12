import 'package:earhquake_stock_managment/core/common/models/item_and_quantities/item_and_quantities_model.dart';
import 'package:earhquake_stock_managment/core/utils/constants/hive/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ItemAndQuantityCacheManager {
  ItemAndQuantityCacheManager(this.key) {
    init();
  }

  final String key;
  Box<ItemAndQuantites>? _box;

  Box<ItemAndQuantites>? get box => _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> addItems(List<ItemAndQuantites> values) async {
    await box?.addAll(values);
  }

  ItemAndQuantites? getItem(String key) {
    return box?.get(key);
  }

  Future<ItemAndQuantites> addValue(ItemAndQuantites value) async {
    await box?.add(value);
    return value;
  }

  Future<void> putValue(ItemAndQuantites value) async {
    await box?.put(key, value);
  }

  Future<void> putAtValue(int index, ItemAndQuantites value) async {
    await box?.putAt(index, value);
  }

  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  Future<void> removeAtItem(int index) async {
    await box?.deleteAt(index);
  }

  List<ItemAndQuantites> getValues() {
    return box?.values.toList() ?? [];
  }

  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.itemsAndQuantityId)) {
      Hive.registerAdapter(ItemAndQuantitesAdapter());
    }
  }
}
