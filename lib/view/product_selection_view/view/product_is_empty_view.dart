import 'package:earhquake_stock_managment/core/components/appbar/base_app_bar.dart';
import 'package:earhquake_stock_managment/core/components/text/body/body_medium_text.dart';
import 'package:earhquake_stock_managment/core/components/text/headline/headline4_text.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constants/app_color.dart';

class ProductIsEmptyView extends StatelessWidget {
  const ProductIsEmptyView({super.key});
  static const routeName = 'productIsEmpty';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: 'Tıra Ürün Seçimi'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundColor: AppColors.athensGray,
              child: Image.asset('assets/images/inbox-archive-fill.png'),
            ),
            const SizedBox(height: 30),
            Headline4Text(
              text: 'Ürün Seçilmedi',
              color: AppColors.textColor,
            ),
            const SizedBox(height: 30),
            BodyMediumText(
              text:
                  'Lütfen ürün sekmesinden ilk önce ürünleri yükleme yapınız.',
              textAlign: TextAlign.center,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
