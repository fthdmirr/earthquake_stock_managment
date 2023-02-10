import 'package:earhquake_stock_managment/core/components/dropdown_input.dart';
import 'package:earhquake_stock_managment/core/constants/cities_and_districts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40),
          DropdownInput<String>(
            dropdownValues: CitiesAndDistricts.values.map((e) => e.name).toList(),
          )
        ],
      ),
    );
  }
}
