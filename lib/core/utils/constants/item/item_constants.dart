import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/main.dart';

class ItemConstants {
  final List<InventoryItem> _inventoryItems = [
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
      name: 'Çocuk Kıyafet',
      quantity: 0,
      icon: 'women_clothes_icon',
    ),
    InventoryItem(
      name: 'Erkek Ayakkabı',
      quantity: 0,
    ),
    InventoryItem(
      name: 'Kadın Ayakkabı',
      quantity: 0,
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
      name: 'Kuru Gıda',
      quantity: 0,
      icon: 'food_icon',
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
    InventoryItem(
      name: 'Odun',
      quantity: 0,
    ),
    InventoryItem(
      name: 'Isıtıcı',
      quantity: 0,
    ),
    InventoryItem(
      name: 'Tüp',
      quantity: 0,
    ),
    InventoryItem(
      name: 'Powerbank',
      quantity: 0,
    ),
    InventoryItem(
      name: 'Jenaratör',
      quantity: 0,
    ),
    InventoryItem(
      name: 'Telefon',
      quantity: 0,
    ),
    InventoryItem(
      name: 'Battaniye',
      quantity: 0,
    ),
  ];

  _getAllItems() {
    _inventoryItems.addAll(itemCacheManager.getValues());
  }

  List<InventoryItem> get inventoryItems {
    _getAllItems();
    return _inventoryItems;
  }
}
