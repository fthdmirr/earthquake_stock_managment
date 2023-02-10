import 'package:flutter/material.dart';

class DropdownInput<T> extends StatelessWidget {
  const DropdownInput({super.key, required this.dropdownValues});

  final List<T> dropdownValues;

  @override
  Widget build(BuildContext context) {
    T dropDownValue = dropdownValues.first;
    return StatefulBuilder(
      builder: (context, setState) => DropdownButton<T>(
        value: dropDownValue,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.black,
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
