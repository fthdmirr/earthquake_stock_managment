import '../../core/common/provider/base_provider.dart';

class AddedCategoriesViewModel extends BaseViewModel {
  AddedCategoriesViewModel({
    required super.context,
  });

  // final TextEditingController _itemTypeNameController = TextEditingController();
  // final TextEditingController _itemNameController = TextEditingController();

  // TextEditingController get itemTypeNameController => _itemTypeNameController;
  // TextEditingController get itemNameController => _itemNameController;

  // List<String> history = [];

  // Future<void> addedItemType() async {
  //   if (_itemTypeNameController.text.isEmpty) return;

  //   await itemTypeCacheManager.addValue(ItemType(_itemTypeNameController.text));
  //   history.add(_itemTypeNameController.text);
  //   _itemTypeNameController.clear();
  //   notifyListeners();
  // }

  // Future<void> addedItem() async {
  //   if (_itemNameController.text.isEmpty) return;

  //   await itemCacheManager.addValue(Item(_itemNameController.text));
  //   history.add(_itemNameController.text);
  //   _itemNameController.clear();
  //   notifyListeners();
  // }
}
