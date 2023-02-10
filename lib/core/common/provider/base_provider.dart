import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late BuildContext context;
  bool isDisposing = false;

  BaseViewModel({required this.context}) {
    initViewModel();
  }

  bool isLoading = false;

  changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future initViewModel() async {
    if (isDisposing) return;
    return Future.value();
  }

  @override
  void dispose() {
    isDisposing = true;
    super.dispose();
  }
}
