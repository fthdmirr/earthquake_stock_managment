import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/appbar/base_app_bar.dart';
import 'package:earhquake_stock_managment/core/components/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:earhquake_stock_managment/core/components/container/black_shadow_container.dart';
import 'package:earhquake_stock_managment/view/bottom_bar/viewmodel/bottom_bar_view_model.dart';
import 'package:earhquake_stock_managment/view/home_page/screen/home_view.dart';
import 'package:earhquake_stock_managment/view/products/view/produts_view.dart';
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
        appBar: BaseAppBar(title: _label[model.currentIndex]),
        body: _screens[model.currentIndex],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: CustomBottomNavigationBar(model: model),
        ),
      ),
    );
  }

  final List<Widget> _screens = [
    const HomeView(),
    const ProductsView(),
    const ReportsView(),
  ];

  final List<String> _label = [
    'Mal Kabul',
    'Ürün',
    'Rapor',
  ];
}
