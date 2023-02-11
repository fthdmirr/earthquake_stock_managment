import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/components/dropdown/dropdown_input.dart';
import 'package:earhquake_stock_managment/core/components/input/base_input.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AppBottomSheet {
  Future showBottomSheet(BuildContext context, String icon, int currentQuantity,
      String currentItem, Function()? onPressed) async {
    return await showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      builder: (BuildContext _) => Container(
        height: context.dynamicHeight(0.4),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  onPressed: () {},
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
