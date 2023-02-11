import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/main.dart';

import '../../../core/common/provider/base_provider.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required super.context,
  });

  @override
  initViewModel() async {
    setInventoryItem();

    super.initViewModel();
  }

  add() {
    itemCacheManager.addValue(
      InventoryItem(
        name: 'Çocuk Bezi',
        quantity: 10,
        icon: 'tent_icon',
      ),
    );
    //update();
    notifyListeners();
  }

  // update() {
  //   inventoryItems = itemCacheManager.getValues();
  // }

  setInventoryItem() {
    inventoryItems.addAll(itemCacheManager.getValues());
    notifyListeners();
  }

  List<InventoryItem> inventoryItems = [
    InventoryItem(
      name: 'Erkek Kıyafet',
      quantity: 0,
      icon: 'man_clothes_icon',
    ),
    InventoryItem(
      name: 'Kadın Kıyafet',
      quantity: 0,
      icon: 'women_clothes_icon',
    ),
    InventoryItem(
      name: 'Yiyecek',
      quantity: 0,
      icon: 'food_icon',
    ),
    InventoryItem(
      name: 'Temel Gıda',
      quantity: 0,
      icon: 'staple_food_icon',
    ),
    InventoryItem(
      name: 'Temizlik Malzemesi',
      quantity: 0,
      icon: 'cleaning_materials_icon',
    ),
    InventoryItem(
      name: 'İlaç',
      quantity: 0,
      icon: 'medicine_icon',
    ),
    InventoryItem(
      name: 'Çocuk Maması',
      quantity: 0,
      icon: 'child_food_icon',
    ),
    InventoryItem(
      name: 'Çadır',
      quantity: 0,
      icon: 'tent_icon',
    ),
  ];
}
