import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme/theme.dart';

class Headline6Text extends AutoSizeText {
  Headline6Text({Key? key, required String text, required Color color})
      : super(
          key: key,
          text,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: myTheme.textTheme.titleLarge!.copyWith(
            color: color,
            fontWeight: myTheme.textTheme.titleLarge!.fontWeight,
            fontSize: myTheme.textTheme.titleLarge!.fontSize,
            fontStyle: myTheme.textTheme.titleLarge!.fontStyle,
          ),
        );
}
