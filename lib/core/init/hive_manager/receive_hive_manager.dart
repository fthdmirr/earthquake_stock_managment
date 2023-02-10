import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/i_cache_managar.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReceiveCacheManager extends ICacheManager<ReceiveModel> {
  ReceiveCacheManager(String key) : super(key);

  @override
  Future<void> addItems(List<ReceiveModel> values) async {
    await box?.addAll(values);
  }

  @override
  ReceiveModel? getItem(String key) {
    return box?.get(key);
  }

  @override
  Future<void> putValue(ReceiveModel value) async {
    await box?.put(key, value);
  }

  @override
  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  @override
  List<ReceiveModel>? getValues() {
    return box?.values.toList();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ReceiveModelAdapter());
      Hive.registerAdapter(ItemAdapter());
      Hive.registerAdapter(ItemTypeAdapter());
      Hive.registerAdapter(VehicleAdapter());
    }
  }
}
