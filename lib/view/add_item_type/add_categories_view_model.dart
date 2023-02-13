import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/utils/constants/item/item_constants.dart';
import 'package:earhquake_stock_managment/main.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/common/provider/base_provider.dart';

class AddCategoriesViewModel extends BaseViewModel {
  AddCategoriesViewModel({
    required super.context,
  });

  final TextEditingController _itemNameController = TextEditingController();

  TextEditingController get itemNameController => _itemNameController;

  Future<void> addedItem() async {
    final names = ItemConstants().inventoryItems.map((e) => e.name).toList();
    final isItemInclude = names.firstWhereOrNull((element) => element == itemNameController.text);
    if (isItemInclude != null) return;
    await itemCacheManager.addValue(InventoryItem(name: itemNameController.text, quantity: 0));
    Future.delayed(Duration.zero).then((value) {
      Navigator.pop(context);
    });
  }
}
