import 'package:another_flushbar/flushbar.dart';
import 'package:earhquake_stock_managment/core/components/text/body/body_small_text.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';

Flushbar<dynamic> showFlushbarWidget(String message, IconData? icon) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: AppColors.ligherGreen,
    margin: const EdgeInsets.all(8),
    duration: const Duration(seconds: 2),
    messageText: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: BodySmallText(
            text: message,
            maxLines: 2,
            textAlign: TextAlign.start,
            color: AppColors.dark,
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.green.withOpacity(0.12),
          child: Icon(icon, size: 30, color: AppColors.green),
        ),
      ],
    ),
    borderRadius: BorderRadius.circular(20),
  );
}
