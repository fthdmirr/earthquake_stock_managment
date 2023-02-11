import 'package:earhquake_stock_managment/core/common/models/app_icons_extension.dart';
import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/inventory_item_cache_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/common/provider/base_provider.dart';

class ReceivingViewModel extends BaseViewModel {
  ReceivingViewModel({
    required super.context,
  });

  final InventoryItemCacheManager itemCacheManager =
      InventoryItemCacheManager('inventoryItem');
  List<InventoryItem> tempInventoryItems = [];

  @override
  initViewModel() async {
    setInventoryItem();

    super.initViewModel();
  }

  ada() {
    itemCacheManager.addValue(InventoryItem(
      id: '5',
      name: 'Çocuk Bezi',
      quantity: 10,
      icon: 'tent_icon',
    ));
    notifyListeners();
  }

  setInventoryItem() {
    tempInventoryItems = itemCacheManager.getValues();

    for (var i = 0; i < inventoryItems.length; i++) {
      inventoryItems[i].quantity = tempInventoryItems[i].quantity;
    }
  }

  List<InventoryItem> inventoryItems = [
    InventoryItem(
      id: '1',
      name: 'Erkek Kıyafet',
      quantity: 0,
      icon: 'man_clothes_icon',
    ),
    InventoryItem(
      id: '2',
      name: 'Kadın Kıyafet',
      quantity: 0,
      icon: 'women_clothes_icon',
    ),
    InventoryItem(
      id: '3',
      name: 'Yiyecek',
      quantity: 0,
      icon: 'food_icon',
    ),
    InventoryItem(
      id: '4',
      name: 'Temel Gıda',
      quantity: 0,
      icon: 'staple_food_icon',
    ),
    InventoryItem(
      id: '5',
      name: 'Temizlik Malzemesi',
      quantity: 0,
      icon: 'cleaning_materials_icon',
    ),
    InventoryItem(
      id: '6',
      name: 'İlaç',
      quantity: 0,
      icon: 'medicine_icon',
    ),
    InventoryItem(
      id: '7',
      name: 'Çocuk Maması',
      quantity: 0,
      icon: 'child_food_icon',
    ),
    InventoryItem(
      id: '8',
      name: 'Çadır',
      quantity: 0,
      icon: 'tent_icon',
    ),
  ];

  // Vehicle selectedVehicle = Vehicle.kamyon;
  // TextEditingController carPlate = TextEditingController(text: '');
  // ItemType selectedItemType = ItemType('Adet');
  // Item selectedItem = Item('Kiyafet');
  // String selectedCity = CitiesOfTurkey.kayseri.name;

  // void _getItem() {
  //   items.addAll(itemCacheManager.getValues() ?? []);
  // }

  // void _getItemTypes() {
  //   itemTypes.addAll(itemTypeCacheManager.getValues() ?? []);
  // }

  // void _init() {
  //   _getItem();
  //   _getItemTypes();
  // }

  // Future<void> addReceiving() async {
  //   try {
  //     await receiveCacheManager.addValue(ReceiveModel(
  //       selectedVehicle,
  //       carPlate.text,
  //       selectedItemType,
  //       selectedItem,
  //       int.parse(quantityController.text),
  //       selectedCity,
  //       DateTime.now().toIso8601String(),
  //     ));
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
