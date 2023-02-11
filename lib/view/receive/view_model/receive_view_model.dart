import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/cities_of_turkey.dart';
import 'package:flutter/material.dart';

class ReceiveViewModel extends BaseViewModel {
  ReceiveViewModel({required super.context});

  final TextEditingController vehiclePlate = TextEditingController();
  final String selectedVehicle = 'Kamyon';
  final String fromTheProvience = CitiesOfTurkey.kayseri.name;

  final String selectedItem = 'Meyve';
  final String selectedItemType = 'Koli';
  final TextEditingController quantity = TextEditingController();

  void addedVehicleValues() {}
}
