import 'dart:developer';

import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_input.dart';
import 'package:earhquake_stock_managment/core/components/input/base_input.dart';
import 'package:earhquake_stock_managment/core/init/navigation/navigation_service.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:earhquake_stock_managment/core/utils/constants/item/item_constants.dart';
import 'package:earhquake_stock_managment/core/utils/input_field_generator.dart';
import 'package:earhquake_stock_managment/main.dart';
import 'package:earhquake_stock_managment/view/add_item_type/add_category_view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/common/provider/base_provider.dart';

class HomeViewModel extends BaseViewModel {
  final TextEditingController unitController = TextEditingController();
  HomeViewModel({
    required super.context,
  });

  @override
  initViewModel() async {
    super.initViewModel();
    getInventoryItemsFromHive();
  }

  showModal({
    required InventoryItem item,
    required List<String> dropdownValues,
    required String dropdownValue,
  }) {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (BuildContext ctx) => SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 10,
            left: context.dynamicWidth(0.05),
            right: context.dynamicWidth(0.05),
            top: context.dynamicHeight(0.02),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Seçilen Ürünün Detayını Giriniz.',
                style:
                    TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.greyapp),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                height: context.dynamicHeight(0.05),
                decoration: BoxDecoration(
                  color: AppColors.greyapp.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AppImages.memoryImage(item.icon ?? 'empty_icon'),
                      height: 44,
                      width: 44,
                    ),
                    Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    Text(
                      '${item.quantity}',
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              DropdownInput(
                dropdownValues: dropdownValues,
                title: 'Ürün Tipi',
                dropDownValue: dropdownValue,
                onChanged: (p0) {
                  dropdownValue = p0 ?? dropdownValues.first;
                },
              ),
              BaseInput(
                title: 'Miktar',
                controller: unitController,
                inputFormatter: getTextInputFormatters(
                  onlyNumber: true,
                  spaceFilter: true,
                  positiveIntegerFilter: true,
                ),
                onChanged: (p0) {
                  if (p0 != '' && int.parse(p0) > item.quantity) {
                    unitController.text = item.quantity.toString();
                    unitController.selection = TextSelection.fromPosition(
                      TextPosition(offset: unitController.text.length),
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: context.dynamicHeight(0.045),
                child: ElevatedButton(
                  onPressed: () {
                    addToSepet(
                      InventoryItem(
                        name: item.name,
                        quantity: int.parse(unitController.text),
                        icon: item.icon,
                      ),
                    );
                    //deleteFromInventory(item);
                    itemCacheManager.putValue(
                      InventoryItem(
                        name: item.name,
                        quantity: item.quantity - int.parse(unitController.text),
                        icon: item.icon,
                      ),
                    );
                    notifyListeners();
                  },
                  child: const Text('Tıra Ekle'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getInventoryItemsFromHive() {
    inventoryItems.map(
      (value) {
        itemAndQuantityCacheManager.getValues().any((element) => element.itemName == value.name)
            ? itemAndQuantityCacheManager
                .getValues()
                .where((element) => element.itemName == value.name)
                .map((value2) => value2.quantity)
                .forEach((element) => value.quantity = value.quantity + element)
            : 0;
      },
    ).toList();
    notifyListeners();
  }

  setInventoryItem() {
    reportCacheManager.getValues();
    notifyListeners();
  }

  List<InventoryItem> inventoryItems = ItemConstants().inventoryItems;

  addToSepet(InventoryItem item) {
    sepet.addToBasket(item);
    notifyListeners();
    Future.delayed(const Duration(seconds: 0), () {
      Navigator.of(context).pop(true);
    });
  }

  getSepet() {
    inspect(sepet.getBasket());
  }

  updateWhenPop() async {
    await NavigationService.instance.navigateToPage(AddCategoryView.routeName);
    
    notifyListeners();
  }
}
