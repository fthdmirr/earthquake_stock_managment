import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/utils/constants/hive/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'item_and_quantities_model.g.dart';

@HiveType(typeId: HiveConstants.itemsAndQuantityId)
class ItemAndQuantites {
  ItemAndQuantites({
    required this.quantity,
    required this.itemName,
  });
  @HiveField(0)
  final int quantity;
  @HiveField(1)
  final String itemName;
}
