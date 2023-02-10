import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/theme.dart';

class BodyText extends AutoSizeText {
  BodyText({
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
          style: myTheme.textTheme.bodyLarge!.copyWith(
            color: color,
            fontWeight: myTheme.textTheme.bodyLarge!.fontWeight,
            fontSize: myTheme.textTheme.bodyLarge!.fontSize,
            fontStyle: myTheme.textTheme.bodyLarge!.fontStyle,
          ),
        );
}
