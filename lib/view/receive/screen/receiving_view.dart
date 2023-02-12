import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_input.dart';
import 'package:earhquake_stock_managment/core/components/input/base_input.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_model.dart';
import 'package:earhquake_stock_managment/core/components/stepper/stepper_view.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/cities_of_turkey.dart';
import 'package:earhquake_stock_managment/view/receive/view_model/receive_view_model.dart';
import 'package:flutter/services.dart';

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
          if (index == 0) {
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
          key: model.formKeyStep1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Headline5Text(
                text:
                    'Kabul edeceğiniz tırın ve tır içerisindeki malzeme bilgisini giriniz.',
                color: AppColors.dark,
              ),
              const SizedBox(height: 40),
              DropdownInput(
                dropdownValues: const ['Kamyon', 'Tır', 'Kamyonet'],
                firstValue: model.selectedVehicle,
                title: 'Araç Tipi',
              ),
              const SizedBox(height: 12),
              BaseInput(
                title: 'Araç Plakası',
                controller: model.vehiclePlate,
                validator: (value) =>
                    value?.isEmpty ?? false ? 'Boş Bırakalımaz' : '',
              ),
              const SizedBox(height: 12),
              DropdownInput(
                dropdownValues:
                    CitiesOfTurkey.values.map((e) => e.name).toList(),
                firstValue: model.fromTheProvience,
                title: 'Gelen İl',
              ),
              BaseInput(
                title: 'Şoför Adı',
                controller: model.name,
                validator: (value) =>
                    value?.isEmpty ?? false ? 'Boş Bırakalımaz' : '',
              ),
              const SizedBox(height: 12),
              BaseInput(
                title: 'Şoför Tel',
                controller: model.telNo,
                validator: (value) =>
                    value?.isEmpty ?? false ? 'Boş Bırakalımaz' : '',
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
          key: model.formKeyStep2,
          child: Column(
            children: [
              Headline5Text(
                text:
                    'Kabul edeceğiniz tırın ve tır içerisindeki malzeme bilgisini giriniz.',
                color: AppColors.dark,
              ),
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
                validator: (value) =>
                    model.quantity.text.isEmpty ? 'Boş Bırakalımaz' : '',
                inputFormatter: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton.icon(
                  onPressed: () => model.addInventoryItem(),
                  icon: const Icon(Icons.add),
                  label: const Text('Ürün Eklemeye Devam Et'),
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
              text: 'Kontrol et ve tamamla!',
              color: AppColors.dark,
            ),
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
          ],
        ),
      ),
    );
  }
}
