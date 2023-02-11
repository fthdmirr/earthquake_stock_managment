import 'dart:developer';

import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/item_hive_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/item_type_hive_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/receive_hive_manager.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/cities_of_turkey.dart';
import 'package:flutter/material.dart';

class ReceivingViewModel extends BaseViewModel {
  ReceivingViewModel({
    required super.context,
    required this.receiveCacheManager,
    required this.itemTypeCacheManager,
    required this.itemCacheManager,
  }) {
    _init();
  }

  final ReceiveCacheManager receiveCacheManager;
  final ItemCacheManager itemCacheManager;
  final ItemTypeCacheManager itemTypeCacheManager;

  final TextEditingController _itemTypeNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  TextEditingController get itemTypeNameController => _itemTypeNameController;
  TextEditingController get quantityController => _quantityController;

  List<Item> items = [
    Item('Kiyafet'),
    Item('Su'),
    Item('Yiyecek'),
    Item('Temel Gida'),
    Item('Temizlik Malzemesi'),
    Item('Çadir'),
    Item('Çocuk Bezi'),
  ];
  List<ItemType> itemTypes = [
    ItemType('Adet'),
    ItemType('Çuval'),
    ItemType('Koli'),
    ItemType('Poşet'),
  ];

  Vehicle selectedVehicle = Vehicle.kamyon;
  TextEditingController carPlate = TextEditingController(text: '');
  ItemType selectedItemType = ItemType('Adet');
  Item selectedItem = Item('Kiyafet');
  String selectedCity = CitiesOfTurkey.kayseri.name;

  void _getItem() {
    items.addAll(itemCacheManager.getValues() ?? []);
  }

  void _getItemTypes() {
    itemTypes.addAll(itemTypeCacheManager.getValues() ?? []);
  }

  void _init() {
    _getItem();
    _getItemTypes();
  }

  Future<void> addReceiving() async {
    try {
      await receiveCacheManager.addValue(ReceiveModel(
        selectedVehicle,
        carPlate.text,
        selectedItemType,
        selectedItem,
        int.parse(quantityController.text),
        selectedCity,
      ));
    } catch (e) {
      log(e.toString());
    }
  }
}
