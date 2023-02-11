import '../../products/view/produts_view.dart';
import '../../receive/screen/receiving_view.dart';
import 'package:flutter/material.dart';

import '../../../core/common/provider/view_model_provider.dart';
import '../../../core/components/appbar/base_app_bar.dart';
import '../../../core/components/bottom_navigation_bar/bottom_navigation_bar.dart';

import '../../reports/view/reports_view.dart';
import '../viewmodel/bottom_bar_view_model.dart';

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
    const ReceivingView(),
    const ProductsView(),
    const ReportsView(),
  ];

  final List<String> _label = [
    'Mal Kabul',
    'Ürün',
    'Rapor',
  ];
}
