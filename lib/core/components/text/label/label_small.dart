import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LabelSmallText extends AutoSizeText {
  LabelSmallText({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        );
}
