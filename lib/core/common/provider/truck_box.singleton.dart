//create Singleton class
import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';

class VehicleBasket {
  static final VehicleBasket _singleton = VehicleBasket._internal();

  factory VehicleBasket() {
    return _singleton;
  }

  VehicleBasket._internal();

  //create a list of trucks
  List<InventoryItem> sepet = [];

  //create a method to add a truck
  void addToBasket(InventoryItem truck) {
    sepet.add(truck);
  }

  //create a method to remove a truck
  void removeFromBasket(InventoryItem truck) {
    sepet.remove(truck);
  }

  void clearAll() {
    sepet.clear();
  }

  //create a method to get all trucks
  List<InventoryItem> getBasket() {
    return sepet;
  }
}
