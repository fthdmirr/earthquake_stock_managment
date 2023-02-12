import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants/app_color.dart';
import '../../utils/theme/theme.dart';
import '../text/button/button_medium_text.dart';

class BaseInput extends StatelessWidget {
  BaseInput({
    super.key,
    required this.title,
    this.hint,
    required this.controller,
    this.inputType,
    this.isEnabled,
    required this.validator,
    this.inputFormatter,
  });

  final String title;
  final TextInputType? inputType;
  final String? hint;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatter;
  final bool? isEnabled;

  String Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      inputFormatters: inputFormatter,
      enabled: isEnabled,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: myTheme.textTheme.bodyMedium!.copyWith(
          color: AppColors.lynch,
        ),
        label: ButtonMediumText(
          text: title,
          color: AppColors.dark,
        ),
        errorStyle: const TextStyle(color: AppColors.orange),
      ),
    );
  }
}
