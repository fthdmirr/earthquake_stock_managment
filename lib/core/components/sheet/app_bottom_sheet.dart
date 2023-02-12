import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_input.dart';
import 'package:earhquake_stock_managment/core/components/input/base_input.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AppBottomSheet {
  Future showBottomSheet(
    BuildContext context,
    String icon,
    int currentQuantity,
    String currentItem,
    Function()? onPressed,
  ) async {
    return showModalBottomSheet(
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (BuildContext ctx) => SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 10,
            left: context.dynamicWidth(0.05),
            right: context.dynamicWidth(0.05),
            top: context.dynamicHeight(0.02),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Seçilen Ürünün Detayını Giriniz.',
                style:
                    TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.greyapp),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                height: context.dynamicHeight(0.05),
                decoration: BoxDecoration(
                  color: AppColors.greyapp.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AppImages.memoryImage(icon),
                      height: 44,
                      width: 44,
                    ),
                    Text(
                      currentItem,
                      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    Text(
                      '$currentQuantity',
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const DropdownInput(
                dropdownValues: ['Koli'],
                title: 'Ürün Tipi',
                firstValue: 'Koli',
              ),
              BaseInput(title: 'Miktar', controller: TextEditingController()),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: context.dynamicHeight(0.045),
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text('Tıra Ekle'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
