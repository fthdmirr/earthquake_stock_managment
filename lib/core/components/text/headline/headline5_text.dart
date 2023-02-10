import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/theme.dart';

class Headline5Text extends AutoSizeText {
  Headline5Text({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: myTheme.textTheme.headlineSmall!.copyWith(
            color: color,
            fontWeight: myTheme.textTheme.headlineSmall!.fontWeight,
            fontSize: myTheme.textTheme.headlineSmall!.fontSize,
            fontStyle: myTheme.textTheme.headlineSmall!.fontStyle,
          ),
        );
}
