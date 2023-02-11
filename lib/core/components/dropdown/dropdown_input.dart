import '../text/body/body_medium_text.dart';
import '../../utils/constants/app_color.dart';
import 'package:flutter/material.dart';

class DropdownInput<T> extends StatelessWidget {
  const DropdownInput(
      {super.key, required this.dropdownValues, this.firstValue, required this.title});

  final List<T> dropdownValues;
  final T? firstValue;
  final String title;

  @override
  Widget build(BuildContext context) {
    T dropDownValue = firstValue ?? dropdownValues.first;
    return StatefulBuilder(
      builder: (context, setState) => DropdownButtonFormField<T>(
        icon: const FittedBox(
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
        ),
        value: dropDownValue,
        elevation: 16,
        isExpanded: true,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(label: Text(title)),
        onChanged: (T? value) {
          setState(() {
            dropDownValue = value as T;
          });
        },
        items: dropdownValues.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: BodyMediumText(
              text: '$value',
              color: AppColors.black,
            ),
          );
        }).toList(),
      ),
    );
  }
}
