import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/common/models/item_and_quantities/item_and_quantities_model.dart';
import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/common/models/status/route_status.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle/vehicle_model.dart';
import 'package:earhquake_stock_managment/core/common/models/vehicle_info/vehicle_info_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/init/navigation/navigation_service.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/cities_of_turkey.dart';
import 'package:earhquake_stock_managment/core/utils/constants/item/item_constants.dart';
import 'package:earhquake_stock_managment/main.dart';
import 'package:earhquake_stock_managment/view/bottom_bar/view/bottom_bar_view.dart';
import 'package:flutter/material.dart';

import '../../../core/components/notification/flushbar_notification.dart';

class ReceiveViewModel extends BaseViewModel {
  ReceiveViewModel({required super.context});

  String selectedVehicle = 'Kamyon';
  String fromTheProvience = CitiesOfTurkey.kayseri.name;

  String selectedItem = ItemConstants().inventoryItems.first.name;
  String selectedItemType = 'Koli';
  final TextEditingController vehiclePlate = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController telNo = TextEditingController();
  final TextEditingController plate = TextEditingController();
  //create formkey
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Vehicle? pickedVehicle;
  List<InventoryItem> inventoryItems = [];

  void addedVehicleValue() {
    pickedVehicle = Vehicle(
        vehicleType: selectedVehicle,
        driverName: name.text.trim().toUpperCase(),
        driverPhone: telNo.text.trim(),
        plate: plate.text.trim().toUpperCase());
  }

  void addInventoryItem() {
    inventoryItems.add(
      InventoryItem(quantity: int.parse(quantity.text.trim()), name: selectedItem),
    );
    quantity.clear();
    notifyListeners();
  }

  Future<void> finishReceive() async {
    if (pickedVehicle == null) return;
    await reportCacheManager.addValue(
      Report(
        dateTime: DateTime.now().toString(),
        vehicleInfo: VehicleInfo(
          destinationCity: fromTheProvience,
          vehicle: pickedVehicle!,
          routeStatus: RouteStatus.came,
          inventoryItems: inventoryItems,
        ),
      ),
    );

    for (var element in inventoryItems) {
      itemAndQuantityCacheManager
          .addValue(ItemAndQuantites(quantity: element.quantity, itemName: element.name));
    }

    _clearDatas();

    if (context.mounted) {
      NavigationService.instance.navigateToPageClear(path: BottomBarView.routeName);
      showFlushbarWidget(
              'Ürün stoklara eklendi. Alttaki bardan stoklarını düzenle ve gönder.', Icons.check)
          .show(context);
    }
  }

  void _clearDatas() {
    quantity.clear();
    name.clear();
    telNo.clear();
    plate.clear();
    vehiclePlate.clear();
    inventoryItems.clear();
    pickedVehicle = null;
  }
}
