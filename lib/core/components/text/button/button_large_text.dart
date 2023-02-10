import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/theme.dart';

class ButtonLargeText extends AutoSizeText {
  ButtonLargeText({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: myTheme.textTheme.labelLarge!.copyWith(
            color: color,
            fontWeight: myTheme.textTheme.labelLarge!.fontWeight,
            fontSize: myTheme.textTheme.labelLarge!.fontSize,
            fontStyle: myTheme.textTheme.labelLarge!.fontStyle,
          ),
        );
}
