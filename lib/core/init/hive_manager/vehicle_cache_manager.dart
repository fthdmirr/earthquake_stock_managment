import 'package:earhquake_stock_managment/core/common/models/vehicle/vehicle_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class VehicleCacheManager {
  VehicleCacheManager(this.key) {
    init();
  }

  final String key;
  Box<Vehicle>? _box;

  Box<Vehicle>? get box => _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> addItems(List<Vehicle> values) async {
    await box?.addAll(values);
  }

  Vehicle? getItem(String key) {
    return box?.get(key);
  }

  Future<void> addValue(Vehicle value) async {
    await box?.add(value);
  }

  // Future<void> putValue(Vehicle value) async {
  //   await box?.put(key, value);
  // }

  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  List<Vehicle>? getValues() {
    return box?.values.toList();
  }

  void registerAdapters() {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(VehicleAdapter());
    }
  }
}
