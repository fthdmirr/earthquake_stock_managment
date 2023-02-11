import 'package:flutter/material.dart';

import '../../core/common/provider/view_model_provider.dart';
import '../../core/components/appbar/base_app_bar.dart';
import '../../core/components/input/base_input.dart';
import '../../main.dart';
import 'added_categories_view_model.dart';

class AddedCategory extends StatelessWidget {
  const AddedCategory({super.key});
  static const routeName = 'addedCategory';

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      model: AddedCategoriesViewModel(
        context: context,
        itemCacheManager: itemCacheManager,
        itemTypeCacheManager: itemTypeCacheManager,
      ),
      builder: (AddedCategoriesViewModel model) => Scaffold(
        appBar: BaseAppBar(
          title: 'Kategoriler',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: BaseInput(
                      title: 'Ürün Ekle',
                      hint: 'Kuru gida - Kiyafet - Su vb.',
                      controller: model.itemNameController,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: model.addedItem,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: BaseInput(
                      title: 'Ürün Tipi Ekle',
                      hint: 'Adet - Çuval - Koli',
                      controller: model.itemTypeNameController,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: model.addedItem,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              if (model.history.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green),
                  child: Text(
                    'En son gerçekleşen işlem: ${model.history.last} eklendi',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
