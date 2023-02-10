// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_provider.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  final BaseViewModel model;
  final Widget Function(T model) builder;

  const ViewModelProvider({
    super.key,
    required this.model,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        lazy: true,
        create: (BuildContext context) => model as T,
        child: Consumer<T>(
          builder: (
            BuildContext context,
            T value,
            Widget? child,
          ) =>
              builder(value),
        ));
  }
}
