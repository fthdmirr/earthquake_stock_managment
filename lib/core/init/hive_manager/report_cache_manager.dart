import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/utils/constants/hive/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReportCacheManager {
  ReportCacheManager(this.key) {
    init();
  }

  final String key;
  Box<Report>? _box;

  Box<Report>? get box => _box;

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> addItems(List<Report> values) async {
    await box?.addAll(values);
  }

  Report? getItem(String key) {
    return box?.get(key);
  }

  Future<Report> addValue(Report value) async {
    await box?.add(value);
    return value;
  }

  // Future<void> putValue(Report value) async {
  //   await box?.put(key, value);
  // }

  Future<void> removeItem(String key) async {
    await box?.delete(key);
  }

  List<Report>? getValues() {
    return box?.values.toList();
  }

  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.reportId)) {
      Hive.registerAdapter(ReportAdapter());
    }
  }
}
