import 'package:earhquake_stock_managment/core/utils/constants/hive/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'inventory_item_model.g.dart';

@HiveType(typeId: HiveConstants.inventoryItemId)
class InventoryItem {
  InventoryItem({
    required this.quantity,
    required this.name,
    this.icon,
  });
  @HiveField(0)
  int quantity;
  @HiveField(1)
  String name;
  @HiveField(2)
  String? icon;
}
