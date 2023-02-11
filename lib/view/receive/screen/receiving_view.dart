import '../../../core/common/models/receive_model.dart';
import '../../../core/common/provider/view_model_provider.dart';
import '../../../core/components/dropdown/dropdown_and_title.dart';
import '../../../core/components/input/base_input.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/utils/constants/enum/cities_of_turkey.dart';
import '../../../main.dart';
import 'package:earhquake_stock_managment/view/receive/view_model/receiving_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/components/text/headline/headline5_text.dart';
import '../../../core/utils/constants/app_color.dart';
import '../../added_item_type/added_category_view.dart';

class ReceivingView extends StatelessWidget {
  const ReceivingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      model: ReceivingViewModel(
        context: context,
        receiveCacheManager: receiveCacheManager,
        itemCacheManager: itemCacheManager,
        itemTypeCacheManager: itemTypeCacheManager,
      ),
      builder: (ReceivingViewModel model) => Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: Visibility(
            child: FloatingActionButton.extended(
              onPressed: () => NavigationService.instance
                  .navigateToPage(AddedCategory.routeName),
              icon: const Icon(
                Icons.add,
              ),
              label: Headline5Text(
                text: 'Kategori Ekle',
                color: AppColors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownAndTitleWidget(
                    title: 'Araç Tipi',
                    dropdownList: Vehicle.values.map((e) => e.name).toList(),
                    dropDownFirstValue: Vehicle.kamyon.name,
                  ),
                  BaseInput(
                    title: 'Araç Plakasi',
                    hint: 'Lütfen araç plakasi giriniz',
                    controller: model.carPlate,
                  ),
                  const SizedBox(height: 16),
                  DropdownAndTitleWidget(
                    title: 'Gelen İl',
                    dropdownList:
                        CitiesOfTurkey.values.map((e) => e.name).toList(),
                    dropDownFirstValue: model.selectedCity,
                  ),
                  DropdownAndTitleWidget(
                    title: 'Ürün',
                    dropdownList: model.items.map((e) => e.itemName).toList(),
                    dropDownFirstValue: model.selectedItem.itemName,
                  ),
                  DropdownAndTitleWidget(
                    title: 'Ürün Tipi',
                    dropdownList:
                        model.itemTypes.map((e) => e.itemType).toList(),
                    dropDownFirstValue: model.selectedItemType.itemType,
                  ),
                  BaseInput(
                    title: 'Miktar',
                    hint: 'Lütfen gelen ürün miktarini giriniz',
                    inputType: TextInputType.number,
                    controller: model.quantityController,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton.icon(
                      onPressed: model.addReceiving,
                      icon: const Icon(Icons.done),
                      label: const Text('Mal Kabul Yap'))
                ],
              ))),
    );
  }
}
