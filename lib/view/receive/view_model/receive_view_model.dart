import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/common/models/status/route_status.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle/vehicle_model.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle_info/vehicle_info_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/cities_of_turkey.dart';
import 'package:earhquake_stock_managment/main.dart';
import 'package:earhquake_stock_managment/view/bottom_bar/view/bottom_bar_view.dart';
import 'package:flutter/material.dart';

class ReceiveViewModel extends BaseViewModel {
  ReceiveViewModel({required super.context});

  final String selectedVehicle = 'Kamyon';
  final String fromTheProvience = CitiesOfTurkey.kayseri.name;

  final String selectedItem = 'Meyve';
  final String selectedItemType = 'Koli';
  final TextEditingController vehiclePlate = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController telNo = TextEditingController();
  final TextEditingController plate = TextEditingController();

  Vehicle? pickedVehicle;
  List<InventoryItem> inventoryItems = [];

  void addedVehicleValue() {
    pickedVehicle = Vehicle(
        vehicleType: selectedVehicle,
        driverName: name.text.trim(),
        driverPhone: telNo.text.trim(),
        plate: plate.text.trim());
  }

  void addInventoryItem() {
    inventoryItems.add(
      InventoryItem(quantity: int.parse(quantity.text.trim()), name: selectedItem),
    );
    quantity.clear();
  }

  Future<void> finishReceive() async {
    if (pickedVehicle == null) return;
    await reportCacheManager.addValue(Report(
        dateTime: DateTime.now().toIso8601String(),
        vehicleInfo: VehicleInfo(
          destinationCity: fromTheProvience,
          vehicle: pickedVehicle!,
          routeStatus: RouteStatus.came,
          inventoryItems: inventoryItems,
        )));
    _clearDatas();
    Future.delayed(Duration.zero).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => BottomBarView(),
          ),
          (route) => false);
    });
  }

  void _clearDatas() {
    quantity.clear();
    name.clear();
    telNo.clear();
    plate.clear();
    vehiclePlate.clear();
    inventoryItems.clear();
    pickedVehicle = null;
  }
}
