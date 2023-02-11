import 'package:earhquake_stock_managment/core/common/models/app_images/app_images.dart';
import 'package:earhquake_stock_managment/core/common/models/inventory_item.model.dart';

import '../../../core/common/provider/view_model_provider.dart';
import '../../../core/init/navigation/navigation_service.dart';
import 'package:earhquake_stock_managment/view/receive/view_model/receiving_view_model.dart';

import 'package:flutter/material.dart';

import '../../../core/components/text/headline/headline5_text.dart';
import '../../../core/utils/constants/app_color.dart';
import '../../added_item_type/added_category_view.dart';

class ReceivingView extends StatelessWidget {
  const ReceivingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ReceivingViewModel>(
      model: ReceivingViewModel(
        context: context,
      ),
      builder: (ReceivingViewModel model) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.systemBackground,
        floatingActionButton: Visibility(
          child: FloatingActionButton.extended(
            onPressed: () => NavigationService.instance
                .navigateToPage(AddedCategory.routeName),
            icon: const Icon(
              Icons.add,
            ),
            label: Headline5Text(
              text: 'Kategori Ekle',
              color: AppColors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                ),
                shrinkWrap: true,
                itemCount: model.inventoryItems.length,
                itemBuilder: (context, index) => ReceivePageItemWidget(
                  item: model.inventoryItems[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReceivePageItemWidget extends StatelessWidget {
  final InventoryItem item;
  const ReceivePageItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        direction: Axis.vertical,
        spacing: 4,
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: const BoxDecoration(
              color: AppColors.systemBackground,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: item.iconPath ?? AppImages.emptyIcon,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Text(
            item.name ?? '',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
          ),
          Text(
            '${item.quantity} ',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.textColor,
                ),
          )
        ],
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