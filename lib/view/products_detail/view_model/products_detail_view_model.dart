import 'dart:developer';

import '../../../core/common/models/receive_model.dart';
import '../../../core/common/models/send_item_model.dart';
import '../../../core/common/provider/base_provider.dart';
import '../../../core/init/hive_manager/item_type_hive_manager.dart';
import '../../../core/init/hive_manager/receive_hive_manager.dart';
import '../../../core/utils/constants/enum/earhquake_cities_and_districts.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

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
  EarthquakeCitiesAndDistricts selectedEathquakeCity =
      EarthquakeCitiesAndDistricts.adana;
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

  void addSendItem(ReceiveModel receiveModel) {
    sendItemCacheManager.addValue(SendItemModel(
        receiveModel,
        DateTime.now().toIso8601String(),
        selectedEathquakeCity.name,
        int.parse(quantityController.text)));
  }

  // Future<void> sendItem() async {
  //  await receiveCacheManager.putValue();
  // }
}
