import 'package:earhquake_stock_managment/core/components/text/body/body_medium_text.dart';

import '../../../view/bottom_bar/viewmodel/bottom_bar_view_model.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';

class CustomBottomNavigationBar extends BottomNavigationBar {
  CustomBottomNavigationBar({
    super.key,
    required BottomBarViewModel model,
  }) : super(
          currentIndex: model.currentIndex,
          onTap: (index) => model.changeBody(index),
          items: [
            BottomNavigationBarItem(
              label: 'Ana Sayfa',
              icon: Stack(
                children: [
                  const Icon(
                    Icons.local_shipping,
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.red.withOpacity(0.7),
                      child: BodyMediumText(
                        text: '5',
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: 'Mal Kabul',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.fire_truck,
              ),
              label: 'Tır',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.description,
              ),
              label: 'Rapor',
            ),
          ],
        );
}
