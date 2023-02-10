import 'dart:developer';

import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/i_cache_managar.dart';
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

  final ICacheManager<ReceiveModel> receiveCacheManager;
  final ICacheManager<Item> itemCacheManager;
  final ICacheManager<ItemType> itemTypeCacheManager;

  final TextEditingController _itemTypeNameController = TextEditingController();

  TextEditingController get itemTypeNameController => _itemTypeNameController;

  List<Item> items = [
    Item('Kiyafet'),
    Item('Su'),
    Item('Yiyecek'),
    Item('Temel Gida'),
    Item('Temizlik Malzemesi'),
    Item('Çadir'),
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
  String carPlate = '';
  ItemType selectedItemType = ItemType('');

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
      await receiveCacheManager.putValue(ReceiveModel(selectedVehicle, carPlate, selectedItemType));
    } catch (e) {
      log(e.toString());
    }
  }
}
