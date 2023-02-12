import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/components/text/body/body_medium_text.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../../core/common/provider/base_provider.dart';

class BottomBarViewModel extends BaseViewModel {
  BottomBarViewModel({required super.context});

  int currentIndex = 0;

  get baseSelectedPage => null;

  void changeBody(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<BottomNavigationBarItem> get items => [
        BottomNavigationBarItem(
          label: 'Ana Sayfa',
          icon: Stack(
            children: [
              Image(
                image: AppImages.memoryImage('basket_icon'),
                width: 30,
                height: 30,
                color: getIconColor(0),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: AppImages.memoryImage('receive_icon'),
            width: 30,
            height: 30,
            color: getIconColor(1),
          ),
          label: 'Mal Kabul',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Image(
                image: AppImages.memoryImage('basket_icon'),
                width: 30,
                height: 30,
                color: getIconColor(2),
              ),
              Positioned(
                left: 8,
                bottom: 8,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: AppColors.red,
                  child: BodyMediumText(
                    text: basket.length.toString(),
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          label: 'Tır',
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: AppImages.memoryImage('report_icon'),
            width: 30,
            height: 30,
            color: getIconColor(3),
          ),
          label: 'Rapor',
        ),
      ];

  Color getIconColor(int index) =>
      index == currentIndex ? AppColors.black : AppColors.greyapp;
}
