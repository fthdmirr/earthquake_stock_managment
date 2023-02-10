import 'package:earhquake_stock_managment/home/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Deprem Depolama Servisi',
      home: HomePage(),
    );
  }
}
