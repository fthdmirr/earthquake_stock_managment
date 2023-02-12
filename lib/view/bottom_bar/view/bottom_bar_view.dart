import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/appbar/base_app_bar.dart';
import 'package:earhquake_stock_managment/core/components/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:earhquake_stock_managment/view/bottom_bar/viewmodel/bottom_bar_view_model.dart';
import 'package:earhquake_stock_managment/view/home_page/screen/home_view.dart';
import 'package:earhquake_stock_managment/view/product_selection_view/view/product_selection_view.dart';
import 'package:earhquake_stock_managment/view/receive/screen/receiving_view.dart';
import 'package:earhquake_stock_managment/view/reports/view/reports_view.dart';
import 'package:flutter/material.dart';

class BottomBarView extends StatelessWidget {
  BottomBarView({super.key});
  static const routeName = 'bottomBar';

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BottomBarViewModel>(
      model: BottomBarViewModel(context: context),
      builder: (model) => Scaffold(
        backgroundColor: AppColors.mercury,
        appBar: BaseAppBar(title: _label[model.currentIndex]),
        body: _screens[model.currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: CustomBottomNavigationBar(
            model: model,
            barItems: model.items,
          ),
        ),
      ),
    );
  }

  final List<Widget> _screens = [
    const HomeView(),
    const ReceivingView(),
    const ProductSelectionView(),
    const ReportsView(),
  ];

  final List<String> _label = [
    'Ana Sayfa',
    'Mal Kabul',
    'Tır Ürün Seçimi',
    'Rapor',
  ];
}
