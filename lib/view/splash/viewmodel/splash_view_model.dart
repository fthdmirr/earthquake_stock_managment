import '../../../core/common/provider/base_provider.dart';

import '../../../core/init/navigation/navigation_service.dart';
import '../../bottom_bar/view/bottom_bar_view.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel({required super.context});

  void navigateToBottomBar() {
    Future.delayed(
      const Duration(seconds: 3),
      () => NavigationService.instance
          .navigateToPageClear(path: BottomBarView.routeName),
    );
  }
}
