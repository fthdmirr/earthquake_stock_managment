import '../../../core/common/provider/view_model_provider.dart';
import '../../../main.dart';
import '../view_model/product_view_model.dart';

import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      model: ProductsViewModel(
        context: context,
        receiveCacheManager: receiveCacheManager,
        itemCacheManager: itemCacheManager,
      ),
      builder: (ProductsViewModel model) => Scaffold(
        body: ListView.builder(
          itemCount: model.categories.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(model.categories.keys.toList()[index]),
              trailing: Text('${model.categories.values.toList()[index]}'),
              onTap: () =>
                  model.navigateToDetail(model.categories.keys.toList()[index]),
            ),
          ),
        ),
      ),
    );
  }
}
