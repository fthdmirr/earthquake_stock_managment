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
      children: [
        BodySmallText(
          text: message,
          color: AppColors.dark,
        ),
        CircleAvatar(
          radius: 40,
          child: Icon(
            icon,
            size: 28.0,
            color: Colors.white,
          ),
        ),
      ],
    ),
    messageSize: 14,
    borderRadius: BorderRadius.circular(20),
    message: message,
  );
}
