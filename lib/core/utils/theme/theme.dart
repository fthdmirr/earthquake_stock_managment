import 'package:flutter/material.dart';

import '../constants/app_color.dart';

final ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.blueGem,
    centerTitle: true,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Color(0x8a000000),
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    displayMedium: TextStyle(
      color: Color(0x8a000000),
      fontSize: 25,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: TextStyle(
      color: Color(0x8a000000),
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: TextStyle(
      color: Color(0x8a000000),
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'semiBold',
    ),
    titleLarge: TextStyle(
      color: Color(0xdd000000),
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      color: Color(0xdd000000),
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: TextStyle(
      color: Color(0xdd000000),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: TextStyle(
      color: Color(0xdd000000),
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(AppColors.blueGem),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.whiteGrey,
  ),
);
