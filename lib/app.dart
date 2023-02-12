import 'package:earhquake_stock_managment/view/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/utils/app_builder.dart';
import 'core/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: UniqueKey(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Deprem Depo Yönetimi Uygulamasi',
          theme: myTheme,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          navigatorKey: NavigationService.instance.navigatorKey,
          debugShowCheckedModeBanner: false,
          builder: AppBuilder.build,
          home: const SplashView(),
        );
      }),
    );
  }
}
