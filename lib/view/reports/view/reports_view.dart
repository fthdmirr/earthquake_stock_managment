// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:path/path.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:earhquake_stock_managment/core/common/models/send_item_model.dart';

import '../../../core/components/card/product_detail_card.dart';
import '../../../core/components/card/product_selection_card.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  final List<SendItemModel> models = [];

  bool loading = false;

  void changeLoadingStatus() {
    loading = !loading;
    setState(() {});
  }

  Future<void> _exportToExcel() async {
    await Permission.storage.request();
    var status = await Permission.storage.status;

    if (status.isDenied) return;
    changeLoadingStatus();
    final excel = Excel.createExcel();
    final sheet = excel.sheets[excel.getDefaultSheet() as String];
    sheet!.setColWidth(10, 1000);
    sheet.setColAutoFit(3);

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 1)).value =
        'Geliş Tarihi';

    for (var index = 0; index < models.length; index++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: index + 1))
          .value = models[index].receiveModel.date;
    }

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 1)).value =
        'Gelen İl';

    for (var index = 0; index < models.length; index++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: index + 1))
          .value = models[index].receiveModel.city;
    }

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 1)).value =
        'Araç';

    for (var index = 0; index < models.length; index++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: index + 1))
          .value = models[index].receiveModel.vehicle.name;
    }

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 1)).value =
        'Plaka';

    for (var index = 0; index < models.length; index++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: index + 1))
          .value = models[index].receiveModel.carPlate;
    }

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 1)).value =
        'Ürün';

    for (var index = 0; index < models.length; index++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: index + 1))
          .value = models[index].receiveModel.item.itemName;
    }

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 1)).value =
        'Ürün Tipi';

    for (var index = 0; index < models.length; index++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: index + 1))
          .value = models[index].receiveModel.itemType.itemType;
    }

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: 1)).value =
        'Adet';

    for (var index = 0; index < models.length; index++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: index + 1))
          .value = models[index].quantity.toString();
    }
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: 1)).value =
        'Giden İl';

    for (var index = 0; index < models.length; index++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: index + 1))
          .value = models[index].receiveCity;
    }

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: 1)).value =
        'Çikiş Tarihi';

    for (var index = 0; index < models.length; index++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: index + 1))
          .value = models[index].exportDate;
    }

    var fileBytes = excel.save();

    String? downloadsDirectoryPath =
        (await DownloadsPath.downloadsDirectory())?.path;

    File(join(
        "$downloadsDirectoryPath/${DateTime.now().toIso8601String()}.xlsx"))
      ..createSync(recursive: false)
      ..writeAsBytesSync(fileBytes ?? []);
    changeLoadingStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            SizedBox(height: 20),
            ProductDetailCard(),
            ProductSelectionCard(),
          ],
        ),
      ),
    );
  }
}
