import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:earhquake_stock_managment/core/common/provider/base_provider.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/i_cache_managar.dart';

class ReceivingViewModel extends BaseViewModel {
  ReceivingViewModel({
    required super.context,
    required this.receiveCacheManager,
    required this.itemTypeCacheManager,
  });

  final ICacheManager<ReceiveModel> receiveCacheManager;
  final ICacheManager<ItemType> itemTypeCacheManager;

  List<Item> items = [];
  List<ItemType> itemTypes = [];

  void getItems() {
    itemTypeCacheManager.getValues();
  }
}
