// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:earhquake_stock_managment/view/product_selection_view/view/product_is_empty_view.dart';
import 'package:earhquake_stock_managment/view/reports/view/reports_detail.view.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_model.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_view.dart';
import 'package:earhquake_stock_managment/view/product_selection_view/viewmodel/product_selection_view_model.dart';

import '../../../core/components/card/product_selection_card.dart';
import '../../../core/components/dropdown/dropdown_input.dart';
import '../../../core/components/input/base_input.dart';
import '../../../core/utils/constants/enum/cities_of_turkey.dart';

part '../widget/stepper_driver_ınformation.dart';

class ProductSelectionView extends StatelessWidget {
  const ProductSelectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProductSelectionViewModel>(
      model: ProductSelectionViewModel(context: context),
      builder: (model) => model.products.isEmpty
          ? const ProductIsEmptyView()
          : StepperView(
              singleButtontitle: 'Yüklenen Ürünleri Tamamla',
              steppers: [
                StepperModel(title: 'Ürün Seçme', index: 0),
                StepperModel(title: 'Tır Bilgileri', index: 1),
                StepperModel(title: 'Genel Bakış', index: 2),
              ],
              onPressed: (index) async {
                if (index == 1) model.addVehicle();
                if (index == 2) {
                  await model.sendVehicle();
                }
              },
              widgets: [
                _SelectItemList(model: model),
                _StepperTruckInformation(model: model),
                _OverViewPage(model: model)
              ],
            ),
    );
  }
}

class _SelectItemList extends StatelessWidget {
  const _SelectItemList({
    required this.model,
  });
  final ProductSelectionViewModel model;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.products.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => ProductSelectionCard(
        //decrementPrees: () => model.decrement(model.products[index]),
        //incrementPrees: () => model.increment(model.products[index]),
        //controller: TextEditingController(text: model.products[index].quantity.toString()),
        productNumber: model.products[index].quantity,
        inventoryItem: model.products[index],
      ),
    );
  }
}

class _OverViewPage extends StatelessWidget {
  const _OverViewPage({
    required this.model,
  });
  final ProductSelectionViewModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReportsDetailTextPart(
            keyText: 'Araç Tipi',
            valueText: 'Kamyon',
          ),
          const ReportsDetailTextPart(
            keyText: 'Araç Plakası',
            valueText: '34 AY 123',
          ),
          const ReportsDetailTextPart(
            keyText: 'Araç Sürücüsü',
            valueText: 'Ahmet Yılmaz',
          ),
          const ReportsDetailTextPart(
            keyText: 'Telefon Numarası',
            valueText: '0532 123 45 67',
          ),
          const ReportsDetailTextPart(
            keyText: 'Gidilecek Yer',
            valueText: 'Hatay',
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Ürünler',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: model.products.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => ProductSelectionCard(
              //decrementPrees: () => model.decrement(model.products[index]),
              //incrementPrees: () => model.increment(model.products[index]),
              //controller: TextEditingController(),
              productNumber: model.products[index].quantity,
              inventoryItem: model.products[index],
            ),
          ),
        ],
      ),
    );
  }
}
