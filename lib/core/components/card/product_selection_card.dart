// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';
import '../button/custom_bermuda_text_button.dart';
import '../container/white_container.dart';
import '../text/headline/headline2_text.dart';
import '../text/headline/headline3_text.dart';
import '../text/headline/headline4_text.dart';

class ProductSelectionCard extends StatelessWidget {
  void Function() incrementPrees;
  void Function() decrementPrees;
  int productNumber;
  ProductSelectionCard({
    Key? key,
    required this.incrementPrees,
    required this.decrementPrees,
    required this.productNumber,
  }) : super(key: key);

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
                child: Icon(
                  Icons.remove_circle,
                  size: 40,
                ),
              ),
              Row(
                children: [
                  CustomBermudaTextButton(
                    onPressed: () {
                      decrementPrees();
                    },
                    text: '-',
                  ),
                  const SizedBox(width: 20),
                  Headline2Text(
                    text: productNumber.toString(),
                    color: AppColors.black,
                  ),
                  const SizedBox(width: 20),
                  CustomBermudaTextButton(
                    onPressed: () {
                      incrementPrees();
                    },
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
