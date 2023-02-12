import '../../../view/bottom_bar/viewmodel/bottom_bar_view_model.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';

class CustomBottomNavigationBar extends BottomNavigationBar {
  final List<BottomNavigationBarItem> barItems;
  CustomBottomNavigationBar({
    super.key,
    required this.barItems,
    required BottomBarViewModel model,
  }) : super(
          currentIndex: model.currentIndex,
          onTap: (index) => model.changeBody(index),
          selectedLabelStyle: const TextStyle(
            color: AppColors.black,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            color: AppColors.greyapp,
            fontSize: 12,
          ),
          items: barItems,
        );
}
