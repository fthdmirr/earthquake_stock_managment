import 'dart:developer';

import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/i_cache_managar.dart';

class ProductsViewModel extends BaseViewModel {
  ProductsViewModel({
    required super.context,
    required this.receiveCacheManager,
    required this.itemTypeCacheManager,
  }) {
    _getAllReceivings();
  }

  final ICacheManager<ReceiveModel> receiveCacheManager;
  final ICacheManager<ItemType> itemTypeCacheManager;

  List<ReceiveModel> _receivings = [];
  List<ItemType> _itemTypes = [];
  Map<String, int> categories = {};

  void get getCategories {
    for (var received in _receivings) {
      for (var itemType in _itemTypes) {
        if (itemType.itemType == received.itemType.itemType) {
          categories[received.itemType.itemType] = received.quantity;
        }
      }
    }
  }

  Future<void> _getAllReceivings() async {
    try {
      _receivings = receiveCacheManager.getValues() ?? [];
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> _getItemTypes() async {
    try {
      _itemTypes = itemTypeCacheManager.getValues() ?? [];
    } catch (e) {
      log(e.toString());
    }
  }
}
