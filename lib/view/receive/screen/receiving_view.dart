import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_and_title.dart';
import 'package:earhquake_stock_managment/core/components/input/base_input.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/item_hive_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/item_type_hive_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/receive_hive_manager.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/cities_of_turkey.dart';
import 'package:earhquake_stock_managment/view/receive/view_model/receiving_view_model.dart';

import 'package:flutter/material.dart';

class ReceivingView extends StatelessWidget {
  const ReceivingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      model: ReceivingViewModel(
        context: context,
        receiveCacheManager: ReceiveCacheManager('receiving'),
        itemCacheManager: ItemCacheManager('item'),
        itemTypeCacheManager: ItemTypeCacheManager('itemTypes'),
      ),
      builder: (ReceivingViewModel model) => Scaffold(
          body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownAndTitleWidget(
                    title: 'Araç Tipi',
                    dropdownList: Vehicle.values.map((e) => e.name).toList(),
                    dropDownFirstValue: Vehicle.kamyon.name,
                  ),
                  const BaseInput(
                    title: 'Araç Plakasi',
                    hint: 'Lütfen araç plakasi giriniz',
                  ),
                  DropdownAndTitleWidget(
                    title: 'Gelen İl',
                    dropdownList: CitiesOfTurkey.values.map((e) => e.name).toList(),
                    dropDownFirstValue: CitiesOfTurkey.kayseri.name,
                  ),
                  DropdownAndTitleWidget(
                    title: 'Ürün',
                    dropdownList: model.items.map((e) => e.itemName).toList(),
                    dropDownFirstValue: model.items.first.itemName,
                  ),
                  DropdownAndTitleWidget(
                    title: 'Ürün Tipi',
                    dropdownList: model.itemTypes.map((e) => e.itemType).toList(),
                    dropDownFirstValue: model.itemTypes.first.itemType,
                  ),
                  const BaseInput(
                    title: 'Miktar',
                    hint: 'Lütfen gelen ürün miktarini giriniz',
                    inputType: TextInputType.number,
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
