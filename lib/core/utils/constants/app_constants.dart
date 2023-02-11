import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';

class AppConstants {
  static List<Item> items = [
    Item('Kiyafet'),
    Item('Su'),
    Item('Yiyecek'),
    Item('Temel Gida'),
    Item('Temizlik Malzemesi'),
    Item('Çadir'),
    Item('Çocuk Bezi'),
  ];
  static List<ItemType> itemTypes = [
    ItemType('Adet'),
    ItemType('Çuval'),
    ItemType('Koli'),
  ];
}
