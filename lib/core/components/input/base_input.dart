import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  const BaseInput({
    super.key,
    required this.title,
    required this.hint,
    this.inputType,
  });

  final String title;
  final String hint;
  final TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text('$title:   ')),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: TextEditingController(),
            keyboardType: inputType,
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