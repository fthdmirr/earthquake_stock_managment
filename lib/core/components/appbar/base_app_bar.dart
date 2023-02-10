import 'package:earhquake_stock_managment/core/utils/constants/color/app_color.dart';
import 'package:flutter/material.dart';

import '../text/headline/headline3_text.dart';

class BaseAppBar extends AppBar {
  BaseAppBar({
    super.key,
    required String title,
  }) : super(
          title: Headline3Text(
            text: title,
            color: AppColors.white,
          ),
        );
}
