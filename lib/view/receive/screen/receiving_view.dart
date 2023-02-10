import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_and_title.dart';
import 'package:earhquake_stock_managment/core/components/input/base_input.dart';
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
                    hint: 'Lütfen araç plakasi giriniz',
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
                  const BaseInput(
                    title: 'Miktar',
                    hint: 'Lütfen gelen ürün miktarini giriniz',
                    inputType: TextInputType.number,
                  ),
                ],
              ))),
    );
  }
}
