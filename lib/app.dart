import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/components/inapp_notifier/inapp_notifier_service.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
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
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

    return RepaintBoundary(
      key: UniqueKey(),
      child: Builder(builder: (context) {
        InAppNotifier().init(
          navigatorKey: navigatorKey,
          errorColor: AppColors.red,
          warningColor: AppColors.orange,
          successColor: AppColors.primaryColor,
          infoColor: AppColors.primaryColor,
          defaultColor: AppColors.primaryColor,
          closeTitleColor: AppColors.white,
          closeIconColor: AppColors.white,
          closeIcon: AppImages.memoryImage('search_icon'),
        );
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
