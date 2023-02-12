import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

enum InputFormatterType {
  BlockEmoji,
  OnlyNumber,
  OnlyNumberWithDot,
  OnlyNumberWithDotAndComma,
  SpaceFilter,
  PositiveIntegerFilter,
  DecimalFilter,
  DecimalTextInputFormatter,
}

TextInputFormatter getInputFormatter(InputFormatterType type, {int decimalRange = -1}) {
  switch (type) {
    case InputFormatterType.BlockEmoji:
      return FilteringTextInputFormatter.deny(
        RegExp(
            r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
        replacementString: "",
      );

    case InputFormatterType.OnlyNumber:
      return FilteringTextInputFormatter.digitsOnly;

    case InputFormatterType.OnlyNumberWithDot:
      return FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'));

    case InputFormatterType.OnlyNumberWithDotAndComma:
      return FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'));

    case InputFormatterType.SpaceFilter:
      return FilteringTextInputFormatter.deny(RegExp(r'\s\b|\b\s'));

    case InputFormatterType.PositiveIntegerFilter:
      return FilteringTextInputFormatter.allow(RegExp(r'^[1-9][0-9]*$'));

    case InputFormatterType.DecimalFilter:
      return FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?(\.|\,)?\d{0,2}'));

    case InputFormatterType.DecimalTextInputFormatter:
      if (decimalRange == -1) {
        debugPrint('U can change decimalRange value for DecimalTextInputFormatter');
      }
      return DecimalTextInputFormatter(decimalRange: decimalRange);

    default:
      return FilteringTextInputFormatter.deny(RegExp(r"(?=[A-Z]\b)"));
  }
}

List<TextInputFormatter> getTextInputFormatters({
  bool blockEmoji = false,
  bool onlyNumber = false,
  bool onlyNumberWithDot = false,
  bool onlyNumberWithDotAndComma = false,
  bool spaceFilter = false,
  bool positiveIntegerFilter = false,
  bool decimalFilter = false,
  bool decimalTextInputFormatter = false,
  int? decimalRange = -1,
}) {
  List<TextInputFormatter> formatters = [];
  if (blockEmoji) {
    formatters.add(getInputFormatter(InputFormatterType.BlockEmoji));
  }

  if (onlyNumber) {
    formatters.add(getInputFormatter(InputFormatterType.OnlyNumber));
  }

  if (onlyNumberWithDot) {
    formatters.add(getInputFormatter(InputFormatterType.OnlyNumberWithDot));
  }

  if (onlyNumberWithDotAndComma) {
    formatters.add(getInputFormatter(InputFormatterType.OnlyNumberWithDotAndComma));
  }

  if (spaceFilter) {
    formatters.add(getInputFormatter(InputFormatterType.SpaceFilter));
  }

  if (positiveIntegerFilter) {
    formatters.add(getInputFormatter(InputFormatterType.PositiveIntegerFilter));
  }

  if (decimalFilter) {
    formatters.add(getInputFormatter(InputFormatterType.DecimalFilter));
  }

  if (decimalTextInputFormatter) {
    formatters.add(getInputFormatter(InputFormatterType.DecimalTextInputFormatter,
        decimalRange: decimalRange!));
  }

  return formatters;
}

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalRange;

  DecimalTextInputFormatter({
    this.decimalRange = -1,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange > -1) {
      String value = newValue.text.replaceAll(",", ".");

      if (value.contains(".") && value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
