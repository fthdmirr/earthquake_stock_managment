import 'dart:developer';

import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/common/models/inventory_item.model.dart';

import '../../../core/common/provider/base_provider.dart';

class ReceivingViewModel extends BaseViewModel {
  ReceivingViewModel({
    required super.context,
  });

  // final ReceiveCacheManager receiveCacheManager;
  // final ItemCacheManager itemCacheManager;
  // final ItemTypeCacheManager itemTypeCacheManager;

  // TextEditingController get itemTypeNameController => _itemTypeNameController;
  // TextEditingController get quantityController => _quantityController;

  setInventoryItem() {
    //hiveden gelen quantity değerleri ile inventoryItems quantity değerleri eşitlenir.
  }

  List<InventoryItem> inventoryItems = [
    InventoryItem(
      id: '1',
      name: 'Erkek Kıyafet',
      quantity: 0,
      iconPath: AppImages.manClothesIcon,
    ),
    InventoryItem(
      id: '2',
      name: 'Kadın Kıyafet',
      quantity: 0,
      iconPath: AppImages.womenClothesIcon,
    ),
    InventoryItem(
      id: '3',
      name: 'Yiyecek',
      quantity: 0,
      iconPath: AppImages.foodIcon,
    ),
    InventoryItem(
      id: '4',
      name: 'Temel Gıda',
      quantity: 0,
      iconPath: AppImages.stapleFoodIcon,
    ),
    InventoryItem(
        id: '5',
        name: 'Temizlik Malzemesi',
        quantity: 0,
        iconPath: AppImages.cleaningMaterialsIcon),
    InventoryItem(
      id: '6',
      name: 'İlaç',
      quantity: 0,
      iconPath: AppImages.medicineIcon,
    ),
    InventoryItem(
        id: '7',
        name: 'Çocuk Maması',
        quantity: 0,
        iconPath: AppImages.childFoodIcon),
    InventoryItem(
      id: '8',
      name: 'Çadır',
      quantity: 0,
      iconPath: AppImages.tentIcon,
    ),
  ];

  // Vehicle selectedVehicle = Vehicle.kamyon;
  // TextEditingController carPlate = TextEditingController(text: '');
  // ItemType selectedItemType = ItemType('Adet');
  // Item selectedItem = Item('Kiyafet');
  // String selectedCity = CitiesOfTurkey.kayseri.name;

  // void _getItem() {
  //   items.addAll(itemCacheManager.getValues() ?? []);
  // }

  // void _getItemTypes() {
  //   itemTypes.addAll(itemTypeCacheManager.getValues() ?? []);
  // }

  // void _init() {
  //   _getItem();
  //   _getItemTypes();
  // }

  // Future<void> addReceiving() async {
  //   try {
  //     await receiveCacheManager.addValue(ReceiveModel(
  //       selectedVehicle,
  //       carPlate.text,
  //       selectedItemType,
  //       selectedItem,
  //       int.parse(quantityController.text),
  //       selectedCity,
  //       DateTime.now().toIso8601String(),
  //     ));
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
