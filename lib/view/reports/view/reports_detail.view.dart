import 'package:earhquake_stock_managment/core/components/appbar/base_app_bar.dart';
import 'package:earhquake_stock_managment/core/components/card/product_detail_card.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

class ReportsDetailView extends StatelessWidget {
  const ReportsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: 'Rapor Detay'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReportsDetailTextPart(
              keyText: 'Araç Tipi',
              valueText: 'Kamyon',
            ),
            const ReportsDetailTextPart(
              keyText: 'Araç Plakası',
              valueText: '34 AY 123',
            ),
            const ReportsDetailTextPart(
              keyText: 'Araç Sürücüsü',
              valueText: 'Ahmet Yılmaz',
            ),
            const ReportsDetailTextPart(
              keyText: 'Telefon Numarası',
              valueText: '0532 123 45 67',
            ),
            const ReportsDetailTextPart(
              keyText: 'Gidilecek Yer',
              valueText: 'Hatay',
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
            const ProductDetailCard(),
            const ProductDetailCard(),
            const ProductDetailCard(),
            const ProductDetailCard(),
            const ProductDetailCard(),
            const ProductDetailCard(),
            const ProductDetailCard(),
            const ProductDetailCard(),
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
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.black),
              ),
              Text(
                valueText,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.black),
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
