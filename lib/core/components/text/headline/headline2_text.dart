import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/theme.dart';

class Headline2Text extends AutoSizeText {
  Headline2Text({
    Key? key,
    required String text,
    required Color color,
    TextAlign? textAlign,
    int? maxLines,
  }) : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          textAlign: textAlign,
          maxLines: maxLines,
          style: myTheme.textTheme.displayMedium!.copyWith(
            color: color,
            fontWeight: myTheme.textTheme.displayMedium!.fontWeight,
            fontSize: myTheme.textTheme.displayMedium!.fontSize,
            fontStyle: myTheme.textTheme.displayMedium!.fontStyle,
          ),
        );
}
