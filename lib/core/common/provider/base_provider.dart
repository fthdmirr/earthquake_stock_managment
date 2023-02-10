import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BaseViewModel({required this.context});

  BuildContext context;

  bool isLoading = false;

  changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  bool isDisposing = false;

  Future<void> initViewModel() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isDisposing) return;
    });
    return Future.value();
  }

  @override
  void dispose() {
    isDisposing = true;
    super.dispose();
  }
}
