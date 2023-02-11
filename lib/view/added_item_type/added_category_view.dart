import 'package:flutter/material.dart';

import '../../core/common/provider/view_model_provider.dart';
import '../../core/components/appbar/base_app_bar.dart';
import '../../core/components/input/base_input.dart';
import 'added_categories_view_model.dart';

class AddedCategory extends StatelessWidget {
  const AddedCategory({super.key});
  static const routeName = 'addedCategory';

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      model: AddedCategoriesViewModel(
        context: context,
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
                      controller: TextEditingController(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
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
                      controller: TextEditingController(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
