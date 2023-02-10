import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/theme.dart';

class BodyMediumText extends AutoSizeText {
  BodyMediumText({
    Key? key,
    required String text,
    required Color color,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) : super(
          key: key,
          text,
          overflow: overflow,
          textScaleFactor: 1,
          textAlign: textAlign,
          maxLines: maxLines,
          style: myTheme.textTheme.bodyMedium!.copyWith(
            color: color,
            fontWeight: myTheme.textTheme.bodyMedium!.fontWeight,
            fontSize: myTheme.textTheme.bodyMedium!.fontSize,
            fontStyle: myTheme.textTheme.bodyMedium!.fontStyle,
          ),
        );
}
