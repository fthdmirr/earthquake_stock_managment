import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ButtonMediumText extends AutoSizeText {
  ButtonMediumText({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        );
}
