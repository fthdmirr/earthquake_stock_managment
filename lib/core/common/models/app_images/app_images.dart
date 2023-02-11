import 'dart:convert';
import 'package:earhquake_stock_managment/config/app_config.dart';
import 'package:flutter/material.dart';

class AppImages {
  static const commonImage = AppConfig.commonImage;

  static final MemoryImage manClothesIcon = MemoryImage(
    base64Decode(commonImage['man_clothes_icon'] ?? ''),
  );
  static final MemoryImage womenClothesIcon = MemoryImage(
    base64Decode(commonImage['women_clothes_icon'] ?? ''),
  );
  static final MemoryImage foodIcon = MemoryImage(
    base64Decode(commonImage['food_icon'] ?? ''),
  );
  static final MemoryImage stapleFoodIcon = MemoryImage(
    base64Decode(commonImage['staple_food_icon'] ?? ''),
  );
  static final MemoryImage cleaningMaterialsIcon = MemoryImage(
    base64Decode(commonImage['cleaning_materials_icon'] ?? ''),
  );
  static final MemoryImage medicineIcon = MemoryImage(
    base64Decode(commonImage['medicine_icon'] ?? ''),
  );

  static final MemoryImage childFoodIcon = MemoryImage(
    base64Decode(commonImage['child_food_icon'] ?? ''),
  );

  static final MemoryImage tentIcon = MemoryImage(
    base64Decode(commonImage['tent_icon'] ?? ''),
  );

  static final MemoryImage emptyIcon = MemoryImage(
    base64Decode(commonImage['empty_icon'] ?? ''),
  );
}
