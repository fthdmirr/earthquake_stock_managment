import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/inventory_item_cache_manager.dart';

import '../../../core/common/provider/base_provider.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required super.context,
  });

  final InventoryItemCacheManager itemCacheManager =
      InventoryItemCacheManager('inventoryItem');
  List<InventoryItem> tempInventoryItems = [];

  @override
  initViewModel() async {
    //setInventoryItem();

    super.initViewModel();
  }

  ada() {
    itemCacheManager.putAtValue(
      5,
      InventoryItem(
        id: '5',
        name: 'Çocuk Bezi',
        quantity: 10,
        icon: 'tent_icon',
      ),
    );
    notifyListeners();
  }

  setInventoryItem() {
    tempInventoryItems = itemCacheManager.getValues();

    for (var i = 0; i < inventoryItems.length; i++) {
      inventoryItems[i].quantity = tempInventoryItems[i].quantity;
    }
    notifyListeners();
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
}
