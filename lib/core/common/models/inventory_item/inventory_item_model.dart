import 'package:earhquake_stock_managment/core/utils/constants/hive/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'inventory_item_model.g.dart';

@HiveType(typeId: HiveConstants.inventoryItemId)
class InventoryItem {
  InventoryItem({
    required this.id,
    required this.quantity,
    required this.name,
    required this.icon,
  });
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int quantity;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String icon;
}