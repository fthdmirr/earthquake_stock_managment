import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/theme.dart';

class Headline1Text extends AutoSizeText {
  Headline1Text({
    Key? key,
    required String text,
    required Color color,
    TextOverflow? overflow,
    int? maxLines,
    TextAlign? textAlign,
  }) : super(
          key: key,
          text,
          overflow: overflow,
          textScaleFactor: 1,
          textAlign: textAlign,
          maxLines: maxLines,
          style: myTheme.textTheme.displayLarge!.copyWith(
            color: color,
            fontWeight: myTheme.textTheme.displayLarge!.fontWeight,
            fontSize: myTheme.textTheme.displayLarge!.fontSize,
            fontStyle: myTheme.textTheme.displayLarge!.fontStyle,
          ),
        );
}
