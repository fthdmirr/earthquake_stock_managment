import 'package:earhquake_stock_managment/core/components/card/product_selection_card.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ProductSelectionView extends StatelessWidget {
  const ProductSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => const ProductSelectionCard(),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(context.width / 1, 70)),
                child: const Text('data'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
