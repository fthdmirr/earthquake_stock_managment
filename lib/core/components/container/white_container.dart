import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';

class WhiteContainer extends Container {
  WhiteContainer({
    super.key,
    required Widget child,
    double width = double.infinity,
    required double height,
  }) : super(
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child: child,
        );
}
