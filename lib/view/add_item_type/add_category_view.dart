import 'package:earhquake_stock_managment/view/add_item_type/add_categories_view_model.dart';
import 'package:flutter/material.dart';

import '../../core/common/provider/view_model_provider.dart';
import '../../core/components/appbar/base_app_bar.dart';
import '../../core/components/input/base_input.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});
  static const routeName = 'addedCategory';

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      model: AddCategoriesViewModel(
        context: context,
      ),
      builder: (AddCategoriesViewModel model) => Scaffold(
        appBar: BaseAppBar(
          title: 'Kategoriler',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BaseInput(
                title: 'Ürün Ekle',
                hint: 'Ürün ismini giriniz',
                controller: model.itemNameController,
              ),
              const SizedBox(height: 30),
              ElevatedButton(onPressed: model.addedItem, child: const Text('Ürün ekle')),
            ],
          ),
        ),
      ),
    );
  }
}
