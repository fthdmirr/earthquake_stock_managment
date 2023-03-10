import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_input.dart';
import 'package:earhquake_stock_managment/core/components/input/base_input.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_model.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_view.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/cities_of_turkey.dart';
import 'package:earhquake_stock_managment/core/utils/constants/item/item_constants.dart';
import 'package:earhquake_stock_managment/core/utils/input_field_generator.dart';
import 'package:earhquake_stock_managment/view/receive/view_model/receive_view_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/common/provider/view_model_provider.dart';

import 'package:flutter/material.dart';

import '../../../core/components/text/headline/headline5_text.dart';
import '../../../core/utils/constants/app_color.dart';
import '../../reports/view/reports_detail.view.dart';

class ReceivingView extends StatelessWidget {
  const ReceivingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ReceiveViewModel>(
      model: ReceiveViewModel(context: context),
      builder: (ReceiveViewModel model) => StepperView(
        singleButtontitle: 'Devam Et',
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
        onPressed: (index) {
          if (index == 0 && (model.formKey.currentState?.validate() ?? false)) {
            model.addedVehicleValue();
          }
          if (index == 2) model.finishReceive();
        },
      ),
    );
  }
}

class _VehicleInfoPage extends StatelessWidget {
  const _VehicleInfoPage(this.model);

  final ReceiveViewModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
          key: model.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Headline5Text(
                text: 'Kabul edeceğiniz tırın ve tır içerisindeki malzeme bilgisini giriniz.',
                color: AppColors.dark,
              ),
              const SizedBox(height: 40),
              DropdownInput(
                dropdownValues: const ['Kamyon', 'Tır', 'Kamyonet'],
                dropDownValue: model.selectedVehicle,
                onChanged: (p0) {
                  model.selectedVehicle = p0 ?? 'Kamyon';
                },
                title: 'Araç Tipi',
              ),
              const SizedBox(height: 12),
              BaseInput(
                title: 'Araç Plakası',
                inputFormatter: const [],
                textCapitalization: TextCapitalization.characters,
                controller: model.vehiclePlate,
              ),
              const SizedBox(height: 12),
              DropdownInput(
                dropdownValues: CitiesOfTurkey.values.map((e) => e.name).toList(),
                dropDownValue: model.fromTheProvience,
                title: 'Gelen İl',
                onChanged: (p0) {
                  model.fromTheProvience = p0 ?? 'Kamyon';
                },
              ),
              BaseInput(
                title: 'Şoför Adı',
                textCapitalization: TextCapitalization.characters,
                controller: model.name,
              ),
              const SizedBox(height: 12),
              BaseInput(
                title: 'Şoför Telefon',
                controller: model.telNo,
                inputType: TextInputType.number,
                inputFormatter: [
                  MaskTextInputFormatter(
                    initialText: "(XXX) XXX-XX-XX",
                    mask: '(###) ###-##-##',
                    filter: {"#": RegExp(r'^[0-9]*$')},
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemInfoPage extends StatelessWidget {
  const _ItemInfoPage(this.model);
  final ReceiveViewModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
          key: model.formKey,
          child: Column(
            children: [
              DropdownInput(
                dropdownValues: ItemConstants().inventoryItems.map((e) => e.name).toList(),
                dropDownValue: model.selectedItem,
                title: 'Ürün',
                onChanged: (p0) {
                  model.selectedItem = p0 ?? ItemConstants().inventoryItems.first.name;
                },
              ),
              const SizedBox(height: 12),
              DropdownInput(
                dropdownValues: const ['Koli'],
                dropDownValue: model.selectedItemType,
                title: 'Ürün Tipi',
                onChanged: (p0) {
                  model.selectedItemType = p0 ?? 'Koli';
                },
              ),
              const SizedBox(height: 12),
              BaseInput(
                  title: 'Koli',
                  controller: model.quantity,
                  inputType: TextInputType.number,
                  inputFormatter: getTextInputFormatters(
                    onlyNumber: true,
                    spaceFilter: true,
                    positiveIntegerFilter: true,
                  )),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton.icon(
                  onPressed: () => model.addInventoryItem(),
                  icon: const Icon(Icons.add),
                  label:
                      Text(model.inventoryItems.isEmpty ? ' Ürünü Ekle' : 'Ürün Eklemeye Devam Et'),
                ),
              ),
              const SizedBox(height: 12),
              if (model.inventoryItems.isNotEmpty)
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 42,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                        'Eklenen son ürün ${model.inventoryItems.last.quantity} ${model.selectedItemType} ${model.inventoryItems.last.name}',
                        style: const TextStyle(color: Colors.white)),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _OverViewPage extends StatelessWidget {
  const _OverViewPage(this.model);
  final ReceiveViewModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            Headline5Text(
              text: 'Kontrol et ve Tamamla!',
              color: AppColors.dark,
            ),
            const SizedBox(height: 20),
            ReportsDetailTextPart(
              keyText: 'Araç Plakası',
              valueText: model.pickedVehicle?.plate ?? '',
            ),
            ReportsDetailTextPart(
              keyText: 'Araç Sürücüsü',
              valueText: model.pickedVehicle?.driverName ?? '',
            ),
            ReportsDetailTextPart(
              keyText: 'Sürücü Numarası',
              valueText: model.pickedVehicle?.driverPhone ?? '',
            ),
            ReportsDetailTextPart(
              keyText: 'Gelen İl',
              valueText: model.fromTheProvience,
            ),
            ...model.inventoryItems
                .map((e) => ReportsDetailTextPart(
                      keyText: 'Ürün',
                      valueText: '${e.name} - ${e.quantity}',
                    ))
                .toList(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
