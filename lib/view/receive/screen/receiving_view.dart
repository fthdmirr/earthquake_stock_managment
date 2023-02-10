import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/appbar/base_app_bar.dart';
import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_input.dart';
import 'package:earhquake_stock_managment/core/utils/constants/enum/cities_of_turkey.dart';
import 'package:earhquake_stock_managment/view/receive/screen/receiving_view_model.dart';
import 'package:flutter/material.dart';

class ReceivingView extends StatelessWidget {
  const ReceivingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      model: ReceivingViewModel(context: context),
      builder: (model) => Scaffold(
          appBar: BaseAppBar(
            title: 'Mal Kabul',
          ),
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
                    hint: 'Lütfen araç plakası giriniz',
                  ),
                  DropdownAndTitleWidget(
                    title: 'Gelen İl',
                    dropdownList: CitiesOfTurkey.values.map((e) => e.name).toList(),
                    dropDownFirstValue: CitiesOfTurkey.kayseri.name,
                  ),
                  DropdownAndTitleWidget(
                    title: 'Ürün',
                    dropdownList: CitiesOfTurkey.values.map((e) => e.name).toList(),
                    dropDownFirstValue: CitiesOfTurkey.kayseri.name,
                  ),
                  DropdownAndTitleWidget(
                    title: 'Ürün Tipi',
                    dropdownList: CitiesOfTurkey.values.map((e) => e.name).toList(),
                    dropDownFirstValue: CitiesOfTurkey.kayseri.name,
                  ),
                ],
              ))),
    );
  }
}

class BaseInput extends StatelessWidget {
  const BaseInput({
    super.key,
    required this.title,
    required this.hint,
  });

  final String title;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text('$title:   ')),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              hintText: hint,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownAndTitleWidget extends StatelessWidget {
  const DropdownAndTitleWidget({
    super.key,
    required this.title,
    required this.dropdownList,
    this.dropDownFirstValue,
  });

  final String title;
  final List<String> dropdownList;
  final String? dropDownFirstValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text('$title:   ')),
            Expanded(
              flex: 3,
              child: DropdownInput<String>(
                dropdownValues: dropdownList,
                firstValue: dropDownFirstValue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
