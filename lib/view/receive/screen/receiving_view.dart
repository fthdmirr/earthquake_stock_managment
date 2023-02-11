import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_input.dart';
import 'package:earhquake_stock_managment/core/components/input/base_input.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_model.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_view.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/cities_of_turkey.dart';
import 'package:earhquake_stock_managment/view/receive/view_model/receive_view_model.dart';
import 'package:flutter/services.dart';

import '../../../core/common/provider/view_model_provider.dart';

import 'package:flutter/material.dart';

class ReceivingView extends StatelessWidget {
  const ReceivingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ReceiveViewModel>(
        model: ReceiveViewModel(
          context: context,
        ),
        builder: (ReceiveViewModel model) => StepperView(
              steppers: [
                StepperModel(title: 'Tır Bilgisi', index: 0),
                StepperModel(title: 'Malzeme Bilgisi', index: 1),
                StepperModel(title: 'Kontrol', index: 2),
              ],
              widgets: [
                _VehicleInfoPage(model),
                _ItemInfoPage(model),
                _OverViewPage(model),
              ],
              onPressed: () {},
            ));
  }
}

class _VehicleInfoPage extends StatelessWidget {
  const _VehicleInfoPage(this.model);

  final ReceiveViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownInput(
          dropdownValues: const ['Kamyon', 'Tır', 'Kamyonet'],
          firstValue: model.selectedVehicle,
          title: 'Araç Tipi',
        ),
        const SizedBox(height: 12),
        BaseInput(title: 'Araç Plakası', controller: model.vehiclePlate),
        const SizedBox(height: 12),
        DropdownInput(
          dropdownValues: CitiesOfTurkey.values.map((e) => e.name).toList(),
          firstValue: model.fromTheProvience,
          title: 'Gelen İl',
        ),
      ],
    );
  }
}

class _ItemInfoPage extends StatelessWidget {
  const _ItemInfoPage(this.model);
  final ReceiveViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownInput(
          dropdownValues: const ['Kadın Kıyafet', 'Kuru Gıda', 'Meyve'],
          firstValue: model.selectedItem,
          title: 'Ürün',
        ),
        const SizedBox(height: 12),
        DropdownInput(
          dropdownValues: const ['Koli', 'Adet'],
          firstValue: model.selectedItemType,
          title: 'Ürün Tipi',
        ),
        const SizedBox(height: 12),
        BaseInput(
          title: 'Adet',
          controller: model.quantity,
          inputFormatter: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
        ),
      ],
    );
  }
}

class _OverViewPage extends StatelessWidget {
  const _OverViewPage(this.model);
  final ReceiveViewModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownInput(
          dropdownValues: const ['Kamyon', 'Tır', 'Kamyonet'],
          firstValue: model.selectedVehicle,
          title: 'Araç Tipi',
        ),
        const SizedBox(height: 12),
        BaseInput(
          title: 'Araç Plakası',
          controller: model.vehiclePlate,
          isEnabled: false,
        ),
        const SizedBox(height: 12),
        DropdownInput(
          dropdownValues: CitiesOfTurkey.values.map((e) => e.name).toList(),
          firstValue: model.fromTheProvience,
          title: 'Gelen İl',
        ),
        const SizedBox(height: 12),
        DropdownInput(
          dropdownValues: const ['Kadın Kıyafet', 'Kuru Gıda', 'Meyve'],
          firstValue: model.selectedItem,
          title: 'Ürün',
        ),
        const SizedBox(height: 12),
        DropdownInput(
          dropdownValues: const ['Koli', 'Adet'],
          firstValue: model.selectedItemType,
          title: 'Ürün Tipi',
        ),
        const SizedBox(height: 12),
        BaseInput(
          title: 'Araç Plakası',
          controller: model.quantity,
          isEnabled: false,
          inputFormatter: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
        ),
      ],
    );
  }
}
