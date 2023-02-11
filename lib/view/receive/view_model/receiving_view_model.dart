import 'dart:developer';

import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/common/models/inventory_item.model.dart';

import '../../../core/common/models/receive_model.dart';
import '../../../core/common/provider/base_provider.dart';
import '../../../core/init/hive_manager/item_hive_manager.dart';
import '../../../core/init/hive_manager/item_type_hive_manager.dart';
import '../../../core/init/hive_manager/receive_hive_manager.dart';
import '../../../core/utils/constants/enum/cities_of_turkey.dart';
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
  final TextEditingController _quantityController =
      TextEditingController(text: '0');

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
  ];

  setInventoryItem() {
    //hiveden gelen quantity değerleri ile inventoryItems quantity değerleri eşitlenir.
  }

  List<InventoryItem> inventoryItems = [
    InventoryItem(
      id: '1',
      name: 'Erkek Kıyafet',
      quantity: 0,
      iconPath: AppImages.manClothesIcon,
    ),
    InventoryItem(
      id: '2',
      name: 'Kadın Kıyafet',
      quantity: 0,
      iconPath: AppImages.womenClothesIcon,
    ),
    InventoryItem(
      id: '3',
      name: 'Yiyecek',
      quantity: 0,
      iconPath: AppImages.foodIcon,
    ),
    InventoryItem(
      id: '4',
      name: 'Temel Gıda',
      quantity: 0,
      iconPath: AppImages.stapleFoodIcon,
    ),
    InventoryItem(
        id: '5',
        name: 'Temizlik Malzemesi',
        quantity: 0,
        iconPath: AppImages.cleaningMaterialsIcon),
    InventoryItem(
      id: '6',
      name: 'İlaç',
      quantity: 0,
      iconPath: AppImages.medicineIcon,
    ),
    InventoryItem(
        id: '7',
        name: 'Çocuk Maması',
        quantity: 0,
        iconPath: AppImages.childFoodIcon),
    InventoryItem(
      id: '8',
      name: 'Çadır',
      quantity: 0,
      iconPath: AppImages.tentIcon,
    ),
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
        DateTime.now().toIso8601String(),
      ));
    } catch (e) {
      log(e.toString());
    }
  }
}
