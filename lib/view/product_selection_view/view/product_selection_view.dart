import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_model.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_view.dart';
import 'package:earhquake_stock_managment/view/product_selection_view/viewmodel/product_selection_view_model.dart';
import 'package:flutter/material.dart';

import '../../../core/components/card/product_selection_card.dart';

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
        onPressed: () {},
        widget: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => ProductSelectionCard(
                  decrementPrees: () => model.decrement(),
                  incrementPrees: () => model.increment(),
                  productNumber: model.productNumber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
