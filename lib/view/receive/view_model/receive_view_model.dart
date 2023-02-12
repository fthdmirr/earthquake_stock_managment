import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/common/models/status/route_status.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle/vehicle_model.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle_info/vehicle_info_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/init/navigation/navigation_service.dart';
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
  final formKeyStep1 = GlobalKey<FormState>();
  final formKeyStep2 = GlobalKey<FormState>();

  Vehicle? pickedVehicle;
  List<InventoryItem> inventoryItems = [];

  bool validation(int index) {
    if (index == 0) {
      return formKeyStep1.currentState!.validate();
    } else if (index == 1) {
      return formKeyStep2.currentState!.validate();
    }
    return false;
  }

  void addedVehicleValue() {
    if (formKeyStep1.currentState!.validate()) {
      pickedVehicle = Vehicle(
          vehicleType: selectedVehicle,
          driverName: name.text.trim(),
          driverPhone: telNo.text.trim(),
          plate: plate.text.trim());
    }
    notifyListeners();
  }

  void addInventoryItem() {
    inventoryItems.add(
      InventoryItem(
          quantity: int.parse(quantity.text.trim()), name: selectedItem),
    );
    quantity.clear();
  }

  Future<void> finishReceive() async {
    if (formKeyStep2.currentState!.validate()) {
      if (pickedVehicle == null) return;
      await reportCacheManager.addValue(
        Report(
          dateTime: DateTime.now().toIso8601String(),
          vehicleInfo: VehicleInfo(
            destinationCity: fromTheProvience,
            vehicle: pickedVehicle!,
            routeStatus: RouteStatus.came,
            inventoryItems: inventoryItems,
          ),
        ),
      );
      _clearDatas();
      NavigationService.instance
          .navigateToPageClear(path: BottomBarView.routeName);
    }
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
