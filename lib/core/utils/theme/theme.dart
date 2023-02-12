import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_color.dart';

final ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.systemBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: AppColors.deepCove,
    ),
    elevation: 0,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.inter(
      color: AppColors.dark,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    displayMedium: GoogleFonts.inter(
      color: AppColors.dark,
      fontSize: 25,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: GoogleFonts.inter(
      color: AppColors.dark,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: GoogleFonts.inter(
      color: AppColors.dark,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: GoogleFonts.inter(
      color: AppColors.dark,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: GoogleFonts.inter(
      color: AppColors.dark,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: GoogleFonts.inter(
      color: AppColors.dark,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: GoogleFonts.inter(
      color: AppColors.dark,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: GoogleFonts.inter(
      color: AppColors.dark,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        GoogleFonts.inter(
          color: AppColors.dark,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      backgroundColor: const MaterialStatePropertyAll(
        AppColors.green,
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.whiteGrey,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.white,
    modalBackgroundColor: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
  ),
  popupMenuTheme: const PopupMenuThemeData(
    color: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    elevation: 0,
    selectedItemColor: AppColors.dark,
    unselectedItemColor: AppColors.lynch,
    selectedLabelStyle: TextStyle(
      color: AppColors.dark,
    ),
    unselectedLabelStyle: TextStyle(
      color: AppColors.lynch,
    ),
    selectedIconTheme: IconThemeData(
      color: AppColors.dark,
      size: 30,
    ),
    unselectedIconTheme: IconThemeData(
      color: AppColors.lynch,
      size: 30,
    ),
  ),
);
