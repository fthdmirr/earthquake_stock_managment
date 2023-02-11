import 'package:earhquake_stock_managment/core/components/stepper/stepper_model.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_view.dart';
import 'package:earhquake_stock_managment/view/home_page/view_model/home.viewmodel.dart';

import '../../../core/common/provider/view_model_provider.dart';

import 'package:flutter/material.dart';

class ReceivingView extends StatelessWidget {
  const ReceivingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ReceivingViewModel>(
        model: ReceivingViewModel(
          context: context,
        ),
        builder: (ReceivingViewModel model) => StepperView(
              steppers: [
                StepperModel(title: 'Ürün Seçme', index: 0),
                StepperModel(title: 'Ürün Seçme', index: 1),
                StepperModel(title: 'Ürün Seçme', index: 2),
              ],
              widget: Column(),
              onPressed: () {},
            ));
  }
}
