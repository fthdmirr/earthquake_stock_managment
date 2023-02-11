import 'package:flutter/material.dart';

class SheetListModel<T> {
  dynamic key;
  String title;
  String? subtitle;
  T? payload;
  String? selector;
  Widget? trailingIcon;

  SheetListModel({
    required this.key,
    required this.title,
    this.subtitle,
    this.payload,
    this.selector,
    this.trailingIcon,
  });

  factory SheetListModel.fromJson(Map<String, dynamic> map) => SheetListModel(
        key: map["key"] ?? "",
        title: map["title"] ?? "",
        subtitle: map["subtitle"],
        payload: map["payload"],
        selector: map["selector"],
        trailingIcon: map["trailingIcon"],
      );

  Map<String, dynamic> toMap() => {
        "key": key,
        "title": title,
        "subtitle": subtitle,
        "payload": payload,
        "selector": selector,
        "trailingIcon": trailingIcon,
      };
}
