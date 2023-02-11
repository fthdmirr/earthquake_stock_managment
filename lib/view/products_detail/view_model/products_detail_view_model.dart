import '../../../core/common/provider/base_provider.dart';

class ProductsDetailViewModel extends BaseViewModel {
  ProductsDetailViewModel({
    required super.context,
  });

  // final ReceiveCacheManager receiveCacheManager;
  // final ItemTypeCacheManager itemTypeManager;

  // List<ItemType> itemTypes = [
  //   ItemType('Adet'),
  //   ItemType('Çuval'),
  //   ItemType('Koli'),
  // ];

  // String selectedItem = '';
  // TextEditingController quantityController = TextEditingController(text: '0');
  // ItemType selectedItemType = ItemType('Adet');
  // EarthquakeCitiesAndDistricts selectedEathquakeCity =
  //     EarthquakeCitiesAndDistricts.adana;
  // // String get selectedEathquakeDistrict => selectedEathquakeCity.districts.first;

  // void _getSelectedItem() {
  //   selectedItem = ModalRoute.of(context)!.settings.arguments as String;
  // }

  // Future<void> _getItemTypes() async {
  //   try {
  //     itemTypes = itemTypeManager.getValues() ?? [];
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // void addSendItem(ReceiveModel receiveModel) {
  //   sendItemCacheManager.addValue(SendItemModel(
  //       receiveModel,
  //       DateTime.now().toIso8601String(),
  //       selectedEathquakeCity.name,
  //       int.parse(quantityController.text)));
  // }

  // Future<void> sendItem() async {
  //  await receiveCacheManager.putValue();
  // }
}
