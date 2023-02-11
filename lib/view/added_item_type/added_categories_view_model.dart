import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/item_hive_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/item_type_hive_manager.dart';
import 'package:flutter/material.dart';

class AddedCategoriesViewModel extends BaseViewModel {
  AddedCategoriesViewModel({
    required super.context,
    required this.itemTypeCacheManager,
    required this.itemCacheManager,
  });
  final ItemCacheManager itemCacheManager;
  final ItemTypeCacheManager itemTypeCacheManager;

  final TextEditingController _itemTypeNameController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();

  TextEditingController get itemTypeNameController => _itemTypeNameController;
  TextEditingController get itemNameController => _itemNameController;

  List<String> history = [];

  Future<void> addedItemType() async {
    if (_itemTypeNameController.text.isEmpty) return;

    await itemTypeCacheManager.addValue(ItemType(_itemTypeNameController.text));
    history.add(_itemTypeNameController.text);
    _itemTypeNameController.clear();
    notifyListeners();
  }

  Future<void> addedItem() async {
    if (_itemNameController.text.isEmpty) return;
    
    await itemCacheManager.addValue(Item(_itemNameController.text));
    history.add(_itemNameController.text);
    _itemNameController.clear();
    notifyListeners();
  }
}
