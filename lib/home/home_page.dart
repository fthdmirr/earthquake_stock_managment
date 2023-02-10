import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_input.dart';
import 'package:earhquake_stock_managment/core/utils/constants/cities_and_districts.dart';
import 'package:earhquake_stock_managment/home/home_view_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(
      model: HomeViewModel(context: context),
      builder: (model) => Column(
        children: [
          const SizedBox(height: 40),
          DropdownInput<String>(
            dropdownValues:
                CitiesAndDistricts.values.map((e) => e.name).toList(),
          )
        ],
      ),
    );
  }
}
