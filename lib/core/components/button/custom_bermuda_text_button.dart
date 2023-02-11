import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';
import '../text/headline/headline1_text.dart';

class CustomBermudaTextButton extends Container {
  CustomBermudaTextButton({
    super.key,
    required String text,
    required void Function() onPressed,
  }) : super(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.bermuda,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: onPressed,
            child: Headline1Text(
              textAlign: TextAlign.center,
              text: text,
              color: AppColors.white,
            ),
          ),
        );
}
