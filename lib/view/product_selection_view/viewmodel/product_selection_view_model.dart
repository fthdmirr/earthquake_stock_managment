import 'dart:math';

import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/common/models/status/route_status.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle/vehicle_model.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle_info/vehicle_info_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/components/dialog/custom_show_dialog.dart';
import 'package:earhquake_stock_managment/core/init/navigation/navigation_service.dart';
import 'package:earhquake_stock_managment/main.dart';
import 'package:earhquake_stock_managment/view/bottom_bar/view/bottom_bar_view.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants/enum/cities_of_turkey.dart';

class ProductSelectionViewModel extends BaseViewModel {
  ProductSelectionViewModel({required super.context});

  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController vehiclePlateController = TextEditingController();
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController quantity = TextEditingController();

  final String selectedVehicleType = 'Kamyon';
  final String toTheProvience = CitiesOfTurkey.kayseri.name;

  final String selectedItem = 'Meyve';
  final String selectedItemType = 'Koli';

  Vehicle? selectedVehicle;

  List<InventoryItem> get products => super.sepet.getBasket();

  increment(InventoryItem item) {
    item.quantity++;
    notifyListeners();
  }

  decrement(InventoryItem item) {
    item.quantity = max(item.quantity - 1, 0);
    notifyListeners();
  }

  getProducts() {}

  addVehicle() {
    selectedVehicle = Vehicle(
        vehicleType: selectedVehicleType,
        driverName: driverNameController.text,
        driverPhone: phoneNoController.text,
        plate: vehiclePlateController.text);
  }

  sendVehicle() async {
    if (selectedVehicle == null) return;
    await reportCacheManager.addValue(Report(
        vehicleInfo: VehicleInfo(
          destinationCity: toTheProvience,
          vehicle: selectedVehicle!,
          routeStatus: RouteStatus.sending,
          inventoryItems: products,
        ),
        dateTime: DateTime.now().toIso8601String()));
    _clearDatas();

    Future.delayed(Duration.zero).then(
      (value) async {
        NavigationService.instance
            .navigateToPageClear(path: BottomBarView.routeName);
        await customMyDialog(context);
      },
    );
  }

  void _clearDatas() {
    quantity.clear();
    vehicleTypeController.clear();
    vehiclePlateController.clear();
    driverNameController.clear();
    phoneNoController.clear();
    quantity.clear();
    selectedVehicle = null;
  }
}
