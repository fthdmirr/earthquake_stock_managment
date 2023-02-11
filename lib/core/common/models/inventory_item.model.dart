import 'package:flutter/material.dart';

class InventoryItem {
  String? id;
  int? quantity;
  String? name;
  MemoryImage? iconPath;

  InventoryItem({this.id, this.quantity, this.name, this.iconPath});

  InventoryItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    name = json['name'];
    iconPath = json['iconPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['name'] = name;
    data['iconPath'] = iconPath;
    return data;
  }
}
