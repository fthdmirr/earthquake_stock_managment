// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:earhquake_stock_managment/core/init/navigation/navigation_service.dart';
import 'package:earhquake_stock_managment/view/bottom_bar/view/bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_model.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_view.dart';
import 'package:earhquake_stock_managment/view/product_selection_view/viewmodel/product_selection_view_model.dart';

import '../../../core/components/card/product_selection_card.dart';
import '../../../core/components/dialog/custom_show_dialog.dart';
import '../../../core/components/dropdown/dropdown_input.dart';
import '../../../core/components/input/base_input.dart';
import '../../../core/utils/constants/app_color.dart';
import '../../../core/utils/constants/enum/cities_of_turkey.dart';
import '../../reports/view/reports_detail.view.dart';

part '../widget/stepper_driver_ınformation.dart';

class ProductSelectionView extends StatelessWidget {
  const ProductSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProductSelectionViewModel>(
      model: ProductSelectionViewModel(context: context),
      builder: (model) => StepperView(
        singleButtontitle: 'Yüklenen Ürünleri Tamamla',
        steppers: [
          StepperModel(title: 'Ürün Seçme', index: 0),
          StepperModel(title: 'Tır Bilgileri', index: 1),
          StepperModel(title: 'Genel Bakış', index: 2),
        ],
        onPressed: (index) async {
          if (index == 2) {
            NavigationService.instance
                .navigateToPageClear(path: BottomBarView.routeName);
            await customMyDialog(context);
          }
          //else if (model.driverInformationController.text.isEmpty) {
          //   NavigationService.instance
          //       .navigateToPage(ProductIsEmptyView.routeName);
          // }
        },
        widgets: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => ProductSelectionCard(
              decrementPrees: () => model.decrement(),
              incrementPrees: () => model.increment(),
              productNumber: model.productNumber,
            ),
          ),
          _StepperTruckInformation(model: model),
          SingleChildScrollView(
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
                const SizedBox(
                  height: 16,
                ),
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
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => ProductSelectionCard(
                    decrementPrees: () => model.decrement(),
                    incrementPrees: () => model.increment(),
                    productNumber: model.productNumber,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
