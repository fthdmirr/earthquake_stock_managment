import 'dart:developer';

import '../../../core/common/models/receive_model.dart';
import '../../../core/common/provider/base_provider.dart';
import '../../../core/init/hive_manager/item_hive_manager.dart';
import '../../../core/init/hive_manager/receive_hive_manager.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../products_detail/view/products_detail_view.dart';

class ProductsViewModel extends BaseViewModel {
  ProductsViewModel({
    required super.context,
    required this.receiveCacheManager,
    required this.itemCacheManager,
  }) {
    _getAllReceivings();
    _getCategories();
    _getItems();
  }

  final ReceiveCacheManager receiveCacheManager;
  final ItemCacheManager itemCacheManager;

  List<ReceiveModel> _receivings = [];
  List<Item> _items = [
    Item('Kıyafet'),
    Item('Su'),
    Item('Yiyecek'),
    Item('Temel Goda'),
    Item('Temizlik Malzemesi'),
    Item('Çadır'),
    Item('Çocuk Bezi'),
  ];
  Map<String, int> categories = {
    'Kıyafet': 0,
    'Su': 0,
    'Yiyecek': 0,
    'Temel Gıda': 0,
    'Temizlik Malzemesi': 0,
    'Çadır': 0,
    'Çocuk Bezi': 0,
  };

  void _getCategories() {
    for (var received in _receivings) {
      for (var item in _items) {
        if (item.itemName == received.item.itemName) {
          categories[received.item.itemName] =
              received.quantity + (categories[received.item.itemName] as int);
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

  Future<void> _getItems() async {
    try {
      _items = itemCacheManager.getValues() ?? [];
    } catch (e) {
      log(e.toString());
    }
  }

  void navigateToDetail(String item) {
    NavigationService.instance
        .navigateToPage(ProductsDetailView.routeName, data: item);
  }

  // Future<void> _getItemTypes() async {
  //   try {
  //     _items = itemCacheManager.getValues() ?? [];
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
