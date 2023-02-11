import 'package:earhquake_stock_managment/view/bottom_bar/viewmodel/bottom_bar_view_model.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';

class CustomBottomNavigationBar extends BottomNavigationBar {
  CustomBottomNavigationBar({
    super.key,
    required BottomBarViewModel model,
  }) : super(
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedItemColor: AppColors.black,
          unselectedItemColor: AppColors.whiteGrey,
          currentIndex: model.currentIndex,
          onTap: (index) => model.changeBody(index),
          selectedLabelStyle: const TextStyle(
            color: AppColors.black,
          ),
          selectedIconTheme: const IconThemeData(
            color: AppColors.black,
            size: 30,
          ),
          unselectedIconTheme: const IconThemeData(
            color: AppColors.whiteGrey,
            size: 30,
          ),
          items: const [
            BottomNavigationBarItem(
              label: 'Mal Kabul',
              icon: Icon(
                Icons.local_shipping,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'Ürün',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.description,
              ),
              label: 'Rapor',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'Kategoriler',
            ),
          ],
        );
}
