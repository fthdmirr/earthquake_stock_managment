import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/theme.dart';

class Headline3Text extends AutoSizeText {
  Headline3Text({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: myTheme.textTheme.displaySmall!.copyWith(
            color: color,
            fontWeight: myTheme.textTheme.displaySmall!.fontWeight,
            fontSize: myTheme.textTheme.displaySmall!.fontSize,
            fontStyle: myTheme.textTheme.displaySmall!.fontStyle,
          ),
        );
}
