import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/appbar/base_app_bar.dart';
import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_and_title.dart';
import 'package:earhquake_stock_managment/core/components/input/base_input.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/earhquake_cities_and_districts.dart';
import 'package:earhquake_stock_managment/main.dart';
import 'package:earhquake_stock_managment/view/products_detail/view_model/products_detail_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductsDetailView extends StatelessWidget {
  const ProductsDetailView({super.key});
  static const routeName = '/productsDetail';
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      model: ProductsDetailViewModel(
        context: context,
        receiveCacheManager: receiveCacheManager,
        itemTypeManager: itemTypeCacheManager,
      ),
      builder: (ProductsDetailViewModel model) => Scaffold(
          appBar: BaseAppBar(title: 'Gönderim'),
          body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  BaseInput(
                    title: 'Ürün',
                    controller: TextEditingController(text: model.selectedItem),
                    isEnabled: false,
                  ),
                  const SizedBox(height: 16),
                  DropdownAndTitleWidget(
                    title: 'Gideceği İl',
                    dropdownList: EarthquakeCitiesAndDistricts.values.map((e) => e.name).toList(),
                    dropDownFirstValue: model.selectedEathquakeCity.name,
                  ),
                  // DropdownAndTitleWidget(
                  //   title: 'Gideceği İlçe',
                  //   dropdownList: model.selectedEathquakeCity.districts,
                  //   dropDownFirstValue: model.selectedEathquakeCity.districts.first,
                  // ),
                  DropdownAndTitleWidget(
                    title: 'Ürün Tipi',
                    dropdownList: model.itemTypes.map((e) => e.itemType).toList(),
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
                      onPressed: () {},
                      icon: const Icon(Icons.done),
                      label: const Text('Gönderim Yap'))
                ],
              ))),
    );
  }
}
