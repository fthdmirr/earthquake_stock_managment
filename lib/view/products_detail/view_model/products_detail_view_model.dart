import 'dart:developer';

import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/item_type_hive_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/receive_hive_manager.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/earhquake_cities_and_districts.dart';
import 'package:flutter/material.dart';

class ProductsDetailViewModel extends BaseViewModel {
  ProductsDetailViewModel({
    required super.context,
    required this.receiveCacheManager,
    required this.itemTypeManager,
  }) {
    _getItemTypes();
    _getSelectedItem();
  }

  final ReceiveCacheManager receiveCacheManager;
  final ItemTypeCacheManager itemTypeManager;

  List<ItemType> itemTypes = [
    ItemType('Adet'),
    ItemType('Çuval'),
    ItemType('Koli'),
  ];

  String selectedItem = '';
  TextEditingController quantityController = TextEditingController(text: '0');
  ItemType selectedItemType = ItemType('Adet');
  EarthquakeCitiesAndDistricts selectedEathquakeCity = EarthquakeCitiesAndDistricts.adana;
  // String get selectedEathquakeDistrict => selectedEathquakeCity.districts.first;

  void _getSelectedItem() {
    selectedItem = ModalRoute.of(context)!.settings.arguments as String;
  }

  Future<void> _getItemTypes() async {
    try {
      itemTypes = itemTypeManager.getValues() ?? [];
    } catch (e) {
      log(e.toString());
    }
  }

  // Future<void> sendItem() async {
  //  await receiveCacheManager.putValue();
  // }
}
