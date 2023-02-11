import 'dart:convert';
import 'package:earhquake_stock_managment/config/app_config.dart';
import 'package:flutter/material.dart';

class AppImages {
  static const commonImage = AppConfig.commonImage;

  static MemoryImage memoryImage(String value) => MemoryImage(
        base64Decode(commonImage[value] ?? ''),
      );
}
