

import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/multipagetabbar/multipagetabbar.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:earhquake_stock_managment/view/reports/viewmodel/reports.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ReportsViewModel>(
      model: ReportsViewModel(context),
      builder: (model) => MultiPageTabbar(
        minWidth: context.dynamicWidth(0.5),
        tabs: model.reportsTabs,
        tabChanged: model.updateSelectedTab,
        initialIndex: model.currentIndex,
        labelColor: AppColors.textColor,
        unselectedLabelColor: AppColors.grey,
        indicatorActive: AppColors.primaryColor,
        children: model.reportsTabs.map((e) => e.payload!).toList(),
      ),
    );
  }
}
