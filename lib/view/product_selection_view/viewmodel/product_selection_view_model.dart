import 'dart:math';

import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle/vehicle_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
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
  final String fromTheProvience = CitiesOfTurkey.kayseri.name;

  final String selectedItem = 'Meyve';
  final String selectedItemType = 'Koli';

  Vehicle? selecteVehicle;

  final List<InventoryItem> products = [
    InventoryItem(
      name: 'Pantulon',
      quantity: 10,
    ),
    InventoryItem(
      name: 'Pantulon',
      quantity: 10,
    ),
  ];

  getProducts() {}

  addVehicle() {
    selecteVehicle = Vehicle(
        vehicleType: selectedVehicleType, driverName: driverNameController.text, driverPhone: phoneNoController.text, plate: vehiclePlateController.text);
  }

  increment(InventoryItem item) {
    item.quantity++;
    notifyListeners();
  }

  decrement(InventoryItem item) {
    item.quantity = max(item.quantity - 1, 0);
    notifyListeners();
  }
}
