// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BaseViewModel({required this.context});

  BuildContext context;

  bool isLoading = false;

  changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
