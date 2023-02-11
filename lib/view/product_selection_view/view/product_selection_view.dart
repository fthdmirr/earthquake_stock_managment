// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_model.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_view.dart';
import 'package:earhquake_stock_managment/view/product_selection_view/viewmodel/product_selection_view_model.dart';

import '../../../core/components/card/product_selection_card.dart';
import '../../../core/components/dropdown/dropdown_input.dart';
import '../../../core/components/input/base_input.dart';
import '../../../core/components/text/headline/headline4_text.dart';
import '../../../core/utils/constants/app_color.dart';
import '../../../core/utils/constants/enum/cities_of_turkey.dart';

part '../widget/stepper_driver_ınformation.dart';

class ProductSelectionView extends StatelessWidget {
  const ProductSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ProductSelectionViewModel>(
      model: ProductSelectionViewModel(context: context),
      builder: (model) => StepperView(
        steppers: [
          StepperModel(title: 'Ürün Seçme', index: 0),
          StepperModel(title: 'Tır Bilgileri', index: 1),
          StepperModel(title: 'Genel Bakış', index: 2),
        ],
        onPressed: () {
          // model.driverInformationController.text.isEmpty
          //     ? NavigationService.instance
          //         .navigateToPage(ProductIsEmptyView.routeName)
          //     : null;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    DropdownInput(
                      title: 'Araç Tipi',
                      dropdownValues: const ['Kamyon', 'Tır', 'Kamyonet'],
                      firstValue: model.selectedVehicle,
                    ),
                    const SizedBox(height: 20),
                    BaseInput(
                      title: 'Araç Plakası',
                      inputType: TextInputType.name,
                      controller: model.vehicleNoController,
                    ),
                    const SizedBox(height: 20),
                    BaseInput(
                      title: 'Şoför Bilgisi',
                      inputType: TextInputType.name,
                      controller: model.driverInformationController,
                    ),
                    const SizedBox(height: 20),
                    BaseInput(
                      title: 'Telefon Numarası',
                      inputType: TextInputType.phone,
                      controller: model.phoneNoController,
                      inputFormatter: [
                        MaskTextInputFormatter(
                          initialText: "(XXX) XXX-XX-XX",
                          mask: '(###) ###-##-##',
                          filter: {"#": RegExp(r'^[0-9]*$')},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    DropdownInput(
                      title: 'Gidecek Yer',
                      dropdownValues:
                          CitiesOfTurkey.values.map((e) => e.name).toList(),
                      firstValue: model.fromTheProvience,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Headline4Text(
                  text: 'Ürünler',
                  color: AppColors.dark,
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
