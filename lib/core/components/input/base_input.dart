import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseInput extends StatelessWidget {
  const BaseInput(
      {super.key,
      required this.title,
      this.hint,
      required this.controller,
      this.inputType,
      this.isEnabled,
      this.inputFormatter,
      this.onChanged,
      this.validator,
      this.textCapitalization = TextCapitalization.none});

  final String title;
  final TextInputType? inputType;
  final String? hint;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatter;
  final bool? isEnabled;
  final void Function(String)? onChanged;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      inputFormatters: inputFormatter,
      enabled: isEnabled,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        hintText: hint,
        labelText: title,
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
