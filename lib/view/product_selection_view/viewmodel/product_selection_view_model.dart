import 'dart:math';

import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants/enum/cities_of_turkey.dart';

class ProductSelectionViewModel extends BaseViewModel {
  ProductSelectionViewModel({required super.context});

  int productNumber = 0;

  final TextEditingController vehicleTypeController = TextEditingController();
  final TextEditingController vehicleNoController = TextEditingController();
  final TextEditingController driverInformationController =
      TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();

  final String selectedVehicle = 'Kamyon';
  final String fromTheProvience = CitiesOfTurkey.kayseri.name;

  final String selectedItem = 'Meyve';
  final String selectedItemType = 'Koli';
  final TextEditingController quantity = TextEditingController();

  increment() {
    productNumber++;
    notifyListeners();
  }

  decrement() {
    productNumber = max(productNumber - 1, 0);
    notifyListeners();
  }
}
