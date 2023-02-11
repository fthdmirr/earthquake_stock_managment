import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReceiveCacheManager {
  ReceiveCacheManager(this.key) {
    init();
  }
  final String key;
  Box<ReceiveModel>? _box;

  Box<ReceiveModel>? get box => _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> addItems(List<ReceiveModel> values) async {
    await box?.addAll(values);
  }

  ReceiveModel? getItem(String key) {
    return box?.get(key);
  }

  Future<void> addValue(ReceiveModel value) async {
    await box?.add(value);
  }

  // Future<void> putValue(ReceiveModel value) async {
  //   await box?.put(key, value);
  // }

  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  List<ReceiveModel>? getValues() {
    return box?.values.toList();
  }

  void registerAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ReceiveModelAdapter());
      Hive.registerAdapter(ItemAdapter());
      Hive.registerAdapter(ItemTypeAdapter());
      Hive.registerAdapter(VehicleAdapter());
    }
  }
}
