// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_provider.dart';

enum ProvideMode {
  CONSUME,
  SELECT,
}

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  final BaseViewModel model;
  final Widget Function(T model) builder;
  final ProvideMode provideMode;

  const ViewModelProvider({
    super.key,
    required this.model,
    required this.builder,
    this.provideMode = ProvideMode.CONSUME,
  });

  @override
  Widget build(BuildContext context) {
    bool isConsume = (this.provideMode == ProvideMode.CONSUME);
    return ChangeNotifierProvider<T>(
      lazy: true,
      create: (BuildContext context) => model as T,
      child: isConsume
          ? Consumer<T>(
              builder: (
                BuildContext context,
                T value,
                Widget? child,
              ) =>
                  builder(value),
            )
          : builder(model as T),
    );
  }
}
