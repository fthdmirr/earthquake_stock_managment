import 'dart:math';

import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';

class ProductSelectionViewModel extends BaseViewModel {
  ProductSelectionViewModel({required super.context});

  int productNumber = 0;

  increment() {
    productNumber++;
    notifyListeners();
  }

  decrement() {
    productNumber = max(productNumber - 1, 0);
    notifyListeners();
  }
}
