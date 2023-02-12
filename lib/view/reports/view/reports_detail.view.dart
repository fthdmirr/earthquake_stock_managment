
import 'package:earhquake_stock_managment/core/common/models/report/report_model.dart';
import 'package:earhquake_stock_managment/core/components/card/product_detail_card.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:earhquake_stock_managment/view/reports/viewmodel/reports_detail_view_model.dart';
import 'package:flutter/material.dart';

class ReportsDetailView extends StatelessWidget {
  final Report report;
  const ReportsDetailView({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rapor Detay', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReportsDetailTextPart(
              keyText: 'Araç Tipi',
              valueText: report.vehicleInfo.vehicle.vehicleType,
            ),
            ReportsDetailTextPart(
              keyText: 'Araç Plakası',
              valueText: report.vehicleInfo.vehicle.plate,
            ),
            ReportsDetailTextPart(
              keyText: 'Araç Sürücüsü',
              valueText: report.vehicleInfo.vehicle.driverName,
            ),
            ReportsDetailTextPart(
              keyText: 'Telefon Numarası',
              valueText: report.vehicleInfo.vehicle.driverPhone,
            ),
            ReportsDetailTextPart(
              keyText: 'Gidilecek Yer',
              valueText: report.vehicleInfo.destinationCity,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Ürünler',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ...report.vehicleInfo.inventoryItems.map(
              (e) => ProductDetailCard(
                item: e,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportsDetailTextPart extends StatelessWidget {
  final String keyText;
  final String valueText;
  const ReportsDetailTextPart({
    super.key,
    this.keyText = 'Araç Tipi',
    this.valueText = 'Kamyon',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                keyText,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),
              ),
              Text(
                valueText,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),
              ),
            ],
          ),
        ),

        //divider
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: const Divider(
            color: AppColors.whiteGrey,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
