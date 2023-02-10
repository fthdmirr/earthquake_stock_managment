import 'package:earhquake_stock_managment/core/components/appbar/base_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Anasayfa',
      ),
    );
  }
}
