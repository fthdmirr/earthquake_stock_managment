import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/components/text/body/body_medium_text.dart';
import 'package:earhquake_stock_managment/core/utils/constants/app_color.dart';
import 'package:earhquake_stock_managment/view/home_page/view_model/home_viewmodel.dart';

import 'package:flutter/material.dart';

import '../../../core/common/models/app_images/app_images.dart';
import '../../../core/common/models/inventory_item/inventory_item_model.dart';
import '../../../core/components/sheet/app_bottom_sheet.dart';

part '../widget/product_info_card.dart';
part '../widget/receive_page_item_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(
      model: HomeViewModel(
        context: context,
      ),
      builder: (HomeViewModel model) => Scaffold(
        body: Column(
          children: [
            const _ProductInfoCard(),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.5),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: model.inventoryItems.length,
                itemBuilder: (context, index) => _ReceivePageItemWidget(
                  item: model.inventoryItems[index],
                  bottomSheetButton: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// DropdownAndTitleWidget(
            //   title: 'Araç Tipi',
            //   dropdownList: Vehicle.values.map((e) => e.name).toList(),
            //   dropDownFirstValue: Vehicle.kamyon.name,
            // ),
            // BaseInput(
            //   title: 'Araç Plakasi',
            //   hint: 'Lütfen araç plakasi giriniz',
            //   controller: model.carPlate,
            // ),
            // const SizedBox(height: 16),
            // DropdownAndTitleWidget(
            //   title: 'Gelen İl',
            //   dropdownList:
            //       CitiesOfTurkey.values.map((e) => e.name).toList(),
            //   dropDownFirstValue: model.selectedCity,
            // ),
            // DropdownAndTitleWidget(
            //   title: 'Ürün',
            //   dropdownList: model.items.map((e) => e.itemName).toList(),
            //   dropDownFirstValue: model.selectedItem.itemName,
            // ),
            // DropdownAndTitleWidget(
            //   title: 'Ürün Tipi',
            //   dropdownList:
            //       model.itemTypes.map((e) => e.itemType).toList(),
            //   dropDownFirstValue: model.selectedItemType.itemType,
            // ),
            // BaseInput(
            //   title: 'Miktar',
            //   hint: 'Lütfen gelen ürün miktarini giriniz',
            //   inputType: TextInputType.number,
            //   controller: model.quantityController,
            //   inputFormatter: <TextInputFormatter>[
            //     FilteringTextInputFormatter.digitsOnly,
            //     LengthLimitingTextInputFormatter(10),
            //   ],
            // ),
            // Image(
            //   image: AppImages.manClothesIcon,
            //   width: 300,
            //   height: 300,
            // ),
            // const SizedBox(height: 50),
            // ElevatedButton.icon(
            //     onPressed: model.addReceiving,
            //     icon: const Icon(Icons.done),
            //     label: const Text('Mal Kabul Yap'))