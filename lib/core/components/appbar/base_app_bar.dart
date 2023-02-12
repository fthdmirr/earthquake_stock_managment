import '../../utils/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../text/headline/headline3_text.dart';

class BaseAppBar extends AppBar {
  BaseAppBar({
    super.key,
    required String title,
    List<Widget>? actions,
  }) : super(
          title: Headline3Text(
            text: title,
            color: AppColors.dark,
          ),
          actions: actions,
        );
}
