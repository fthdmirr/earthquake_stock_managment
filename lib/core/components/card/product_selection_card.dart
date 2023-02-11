import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';
import '../button/custom_bermuda_text_button.dart';
import '../container/white_container.dart';
import '../text/headline/headline2_text.dart';
import '../text/headline/headline3_text.dart';
import '../text/headline/headline4_text.dart';

class ProductSelectionCard extends StatelessWidget {
  const ProductSelectionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.wildSand,
              ),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.pippin,
              ),
              Row(
                children: [
                  CustomBermudaTextButton(
                    onPressed: () {},
                    text: '-',
                  ),
                  const SizedBox(width: 20),
                  Headline2Text(
                    text: '50',
                    color: AppColors.black,
                  ),
                  const SizedBox(width: 20),
                  CustomBermudaTextButton(
                    onPressed: () {},
                    text: '+',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
