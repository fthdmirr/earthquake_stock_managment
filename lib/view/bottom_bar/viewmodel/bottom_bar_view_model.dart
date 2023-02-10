import '../../../core/common/provider/base_provider.dart';

class BottomBarViewModel extends BaseViewModel {
  BottomBarViewModel({required super.context});

  int currentIndex = 0;

  get baseSelectedPage => null;

  void changeBody(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
