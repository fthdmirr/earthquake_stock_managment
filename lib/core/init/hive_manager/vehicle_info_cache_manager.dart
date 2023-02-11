import 'package:earhquake_stock_managment/core/common/models/vehicle_info/vehicle_info_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class VehicleInfoCacheManager {
  VehicleInfoCacheManager(this.key) {
    init();
  }

  final String key;
  Box<VehicleInfo>? _box;

  Box<VehicleInfo>? get box => _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> addVehicleInfos(List<VehicleInfo> values) async {
    await box?.addAll(values);
  }

  VehicleInfo? getVehicleInfo(String key) {
    return box?.get(key);
  }

  Future<void> addValue(VehicleInfo value) async {
    await box?.add(value);
  }

  Future<void> putValue(VehicleInfo value) async {
    await box?.put(key, value);
  }

  Future<void> removeVehicleInfo(String key) async {
    await box?.delete(key);
  }

  List<VehicleInfo>? getValues() {
    return box?.values.toList();
  }

  void registerAdapters() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(VehicleInfoAdapter());
    }
  }
}
