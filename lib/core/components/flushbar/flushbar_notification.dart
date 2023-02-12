import 'package:another_flushbar/flushbar.dart';
import 'package:earhquake_stock_managment/core/components/text/body/body_smaller_text.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';

Flushbar<dynamic> showFlushbarWidget(String message, IconData? icon) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: AppColors.ligherGreen,
    margin: const EdgeInsets.all(10),
    flushbarStyle: FlushbarStyle.FLOATING,
    messageSize: 14,
    borderRadius: BorderRadius.circular(20),
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: BodySmallerText(
            text: message,
            color: AppColors.dark,
            maxLines: 2,
            textAlign: TextAlign.start,
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.green.withOpacity(0.12),
          child: Icon(
            icon,
            size: 30,
            color: AppColors.green,
          ),
        )
      ],
    ),
    messageColor: AppColors.dark,
  );
}
