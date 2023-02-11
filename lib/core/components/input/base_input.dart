import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';

class BaseInput extends StatelessWidget {
  const BaseInput({
    super.key,
    required this.title,
    required this.hint,
    this.inputType,
  });

  final String title;
  final TextInputType? inputType;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text('$title:   ')),
        Expanded(
          flex: 3,
          child: TextFormField(
          
            keyboardType: inputType,
            controller: TextEditingController(),
            decoration: InputDecoration(
              hintText: hint,
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                  color: AppColors.blueGem,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                  color: AppColors.whiteGrey,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 2,
                  style: BorderStyle.solid,
                  color: AppColors.orange,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
