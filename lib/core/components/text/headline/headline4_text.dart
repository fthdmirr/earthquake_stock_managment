import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/theme.dart';

class Headline4Text extends AutoSizeText {
  Headline4Text({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: myTheme.textTheme.headlineMedium!.copyWith(
            color: color,
            fontWeight: myTheme.textTheme.headlineMedium!.fontWeight,
            fontSize: myTheme.textTheme.headlineMedium!.fontSize,
            fontStyle: myTheme.textTheme.headlineMedium!.fontStyle,
          ),
        );
}
