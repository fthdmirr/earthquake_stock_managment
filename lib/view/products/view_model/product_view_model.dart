import '../../../core/common/provider/base_provider.dart';

class ProductsViewModel extends BaseViewModel {
  ProductsViewModel({
    required super.context,
  });

  // List<ReceiveModel> _receivings = [];
  // List<Item> _items = [
  //   Item('Kıyafet'),
  //   Item('Su'),
  //   Item('Yiyecek'),
  //   Item('Temel Goda'),
  //   Item('Temizlik Malzemesi'),
  //   Item('Çadır'),
  //   Item('Çocuk Bezi'),
  // ];
  // Map<String, int> categories = {
  //   'Kıyafet': 0,
  //   'Su': 0,
  //   'Yiyecek': 0,
  //   'Temel Gıda': 0,
  //   'Temizlik Malzemesi': 0,
  //   'Çadır': 0,
  //   'Çocuk Bezi': 0,
  // };

  // void _getCategories() {
  //   for (var received in _receivings) {
  //     for (var item in _items) {
  //       if (item.itemName == received.item.itemName) {
  //         categories[received.item.itemName] =
  //             received.quantity + (categories[received.item.itemName] as int);
  //       }
  //     }
  //   }
  // }

  // Future<void> _getAllReceivings() async {
  //   try {
  //     _receivings = receiveCacheManager.getValues() ?? [];
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // Future<void> _getItems() async {
  //   try {
  //     _items = itemCacheManager.getValues() ?? [];
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // void navigateToDetail(String item) {
  //   NavigationService.instance
  //       .navigateToPage(ProductsDetailView.routeName, data: item);
  // }

  // Future<void> _getItemTypes() async {
  //   try {
  //     _items = itemCacheManager.getValues() ?? [];
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
