import '../../../core/common/provider/base_provider.dart';

class ReceivingViewModel extends BaseViewModel {
  ReceivingViewModel({
    required super.context,
  });

  // final ReceiveCacheManager receiveCacheManager;
  // final ItemCacheManager itemCacheManager;
  // final ItemTypeCacheManager itemTypeCacheManager;

  // final TextEditingController _itemTypeNameController = TextEditingController();
  // final TextEditingController _quantityController = TextEditingController(text: '0');

  // TextEditingController get itemTypeNameController => _itemTypeNameController;
  // TextEditingController get quantityController => _quantityController;

  // List<Item> items = [
  //   Item('Kiyafet'),
  //   Item('Su'),
  //   Item('Yiyecek'),
  //   Item('Temel Gida'),
  //   Item('Temizlik Malzemesi'),
  //   Item('Çadir'),
  //   Item('Çocuk Bezi'),
  // ];
  // List<ItemType> itemTypes = [
  //   ItemType('Adet'),
  //   ItemType('Çuval'),
  //   ItemType('Koli'),
  // ];

  // Vehicle selectedVehicle = Vehicle.kamyon;
  // TextEditingController carPlate = TextEditingController(text: '');
  // ItemType selectedItemType = ItemType('Adet');
  // Item selectedItem = Item('Kiyafet');
  // String selectedCity = CitiesOfTurkey.kayseri.name;

  // void _getItem() {
  //   items.addAll(itemCacheManager.getValues() ?? []);
  // }

  // void _getItemTypes() {
  //   itemTypes.addAll(itemTypeCacheManager.getValues() ?? []);
  // }

  // void _init() {
  //   _getItem();
  //   _getItemTypes();
  // }

  // Future<void> addReceiving() async {
  //   try {
  //     await receiveCacheManager.addValue(ReceiveModel(
  //       selectedVehicle,
  //       carPlate.text,
  //       selectedItemType,
  //       selectedItem,
  //       int.parse(quantityController.text),
  //       selectedCity,
  //       DateTime.now().toIso8601String(),
  //     ));
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
