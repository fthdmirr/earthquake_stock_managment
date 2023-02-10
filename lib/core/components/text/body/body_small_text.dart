import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BodySmallText extends AutoSizeText {
  BodySmallText({
    Key? key,
    required String text,
    required Color color,
    int? maxLines,
    TextAlign? textAlign,
  }) : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          textAlign: textAlign,
          maxLines: maxLines,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
}
