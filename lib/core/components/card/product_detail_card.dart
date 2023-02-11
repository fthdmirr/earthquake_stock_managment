import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';
import '../container/white_container.dart';
import '../text/headline/headline2_text.dart';
import '../text/headline/headline3_text.dart';
import '../text/headline/headline4_text.dart';

class ProductDetailCard extends StatelessWidget {
  const ProductDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.wildSand,
              ),
              const SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Headline3Text(
                    text: 'Erkek Kıyafet',
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
            text: '50',
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
