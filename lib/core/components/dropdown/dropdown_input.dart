import '../text/body/body_medium_text.dart';
import '../../utils/constants/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropdownInput<T> extends StatelessWidget {
  DropdownInput({
    super.key,
    required this.dropdownValues,
    required this.title,
    this.enable,
    required this.dropDownValue,
    required this.onChanged,
  });

  final List<T> dropdownValues;
  final String title;
  final bool? enable;
  final Function(T?)? onChanged;
  T dropDownValue;

  @override
  Widget build(BuildContext context) {
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
            onChanged!(value);
          });
        },
        items: dropdownValues.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            enabled: enable ?? true,
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
