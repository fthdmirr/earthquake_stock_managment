import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/common/models/inventory_item/inventory_item_model.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';
import '../container/white_container.dart';
import '../text/headline/headline2_text.dart';
import '../text/headline/headline3_text.dart';
import '../text/headline/headline4_text.dart';

class ProductDetailCard extends StatelessWidget {
  final InventoryItem item;
  const ProductDetailCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.wildSand,
                child: Image(
                  image: AppImages.memoryImage(item.icon ?? 'empty_icon'),
                  width: 25,
                  height: 25,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Headline3Text(
                    text: item.name,
                    color: AppColors.dark,
                  ),
                  Headline4Text(
                    text: 'Kutu',
                    color: AppColors.darkGrey,
                  ),
                ],
              ),
            ],
          ),
          Headline2Text(
            text: item.quantity.toString(),
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
