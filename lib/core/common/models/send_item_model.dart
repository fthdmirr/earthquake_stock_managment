import 'package:earhquake_stock_managment/core/common/models/receive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'send_item_model.g.dart';

@HiveType(typeId: 4)
class SendItemModel {
  SendItemModel(
    this.receiveModel,
    this.exportDate,
    this.receiveCity,
    this.quantity,
  );

  @HiveField(0)
  final ReceiveModel receiveModel;
  @HiveField(1)
  final String exportDate;
  @HiveField(2)
  final String receiveCity;
  @HiveField(3)
  final int quantity;
}
