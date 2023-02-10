import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class ReceiveModel {
  ReceiveModel(this.vehicle, this.carPlate, this.itemType);
  @HiveField(0)
  final Vehicle vehicle;
  @HiveField(1)
  final String carPlate;
  @HiveField(2)
  final ItemType itemType;
}

@HiveType(typeId: 1)
class Item {
  Item(this.itemName);

  @HiveField(0)
  final String itemName;
}

@HiveType(typeId: 2)
class ItemType {
  ItemType(this.itemType);

  @HiveField(0)
  final String itemType;
}

@HiveType(typeId: 3)
enum Vehicle {
  @HiveField(0)
  kamyon,
  @HiveField(1)
  kamyonet,
  @HiveField(2)
  tir,
}
