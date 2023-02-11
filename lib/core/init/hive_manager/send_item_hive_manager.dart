import 'package:earhquake_stock_managment/core/common/models/send_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SendItemCacheManager {
  SendItemCacheManager(this.key) {
    init();
  }

  final String key;
  Box<SendItemModel>? _box;

  Box<SendItemModel>? get box => _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> addSendItemModels(List<SendItemModel> values) async {
    await box?.addAll(values);
  }

  SendItemModel? getSendItemModel(String key) {
    return box?.get(key);
  }

  Future<void> addValue(SendItemModel value) async {
    await box?.add(value);
  }

  Future<void> putValue(SendItemModel value) async {
    await box?.put(key, value);
  }

  Future<void> removeSendItemModel(String key) async {
    await box?.delete(key);
  }

  List<SendItemModel>? getValues() {
    return box?.values.toList();
  }

  void registerAdapters() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(SendItemModelAdapter());
    }
  }
}
