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
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Gelen İl:  '),
                    Expanded(
                      child: DropdownInput<String>(
                        dropdownValues: CitiesOfTurkey.values.map((e) => e.name).toList(),
                        firstValue: CitiesOfTurkey.kayseri.name,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ))),
    );
  }
}
