import 'package:earhquake_stock_managment/core/utils/constants/color/app_color.dart';
import 'package:flutter/material.dart';

class DropdownInput<T> extends StatelessWidget {
  const DropdownInput({super.key, required this.dropdownValues, this.firstValue});

  final List<T> dropdownValues;
  final T? firstValue;

  @override
  Widget build(BuildContext context) {
    T dropDownValue = firstValue ?? dropdownValues.first;
    return StatefulBuilder(
      builder: (context, setState) => DropdownButton<T>(
        value: dropDownValue,
        elevation: 16,
        isExpanded: true,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: AppColors.blueGem,
        ),
        onChanged: (T? value) {
          setState(() {
            dropDownValue = value as T;
          });
        },
        items: dropdownValues.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(value as String),
          );
        }).toList(),
      ),
    );
  }
}
