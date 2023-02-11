import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/common/models/status/route_status.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle/vehicle_model.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle_info/vehicle_info_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/cities_of_turkey.dart';
import 'package:earhquake_stock_managment/main.dart';
import 'package:flutter/material.dart';

class ReceiveViewModel extends BaseViewModel {
  ReceiveViewModel({required super.context});

  final TextEditingController vehiclePlate = TextEditingController();
  final String selectedVehicle = 'Kamyon';
  final String fromTheProvience = CitiesOfTurkey.kayseri.name;

  final String selectedItem = 'Meyve';
  final String selectedItemType = 'Koli';
  final TextEditingController quantity = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController telNo = TextEditingController();
  final TextEditingController plate = TextEditingController();

  Vehicle? pickedVehicle;
  List<InventoryItem> inventoryItems = [];

  Future<void> addedVehicleValues() async {
    pickedVehicle = await vehicleCacheManager.addValue(Vehicle(
        vehicleType: selectedVehicle,
        driverName: name.text.trim(),
        driverPhone: telNo.text.trim(),
        plate: plate.text.trim()));
  }

  Future<void> addInventoryItem(inventoryItem) async {
    inventoryItems.add(inventoryItem);
  }

  Future<void> finishReceive(int quantity) async {
    reportCacheManager.addValue(Report(
        dateTime: DateTime.now().toIso8601String(),
        vehicleInfo: VehicleInfo(
          destinationCity: fromTheProvience,
          vehicle: pickedVehicle!,
          routeStatus: RouteStatus.came,
          inventoryItems: inventoryItems,
        )));
  }

  void _clearDatas() {}
}
