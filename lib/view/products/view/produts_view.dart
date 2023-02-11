import 'package:earhquake_stock_managment/core/common/provider/view_model_provider.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/item_hive_manager.dart';
import 'package:earhquake_stock_managment/core/init/hive_manager/receive_hive_manager.dart';
import 'package:earhquake_stock_managment/view/products/view_model/product_view_model.dart';

import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      model: ProductsViewModel(
        context: context,
        receiveCacheManager: ReceiveCacheManager('receiving'),
        itemCacheManager: ItemCacheManager('item'),
      ),
      builder: (ProductsViewModel model) => Scaffold(
        body: ListView.builder(
          itemCount: model.categories.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(model.categories.keys.toList()[index]),
              trailing: Text('${model.categories.values.toList()[index]}'),
            ),
          ),
        ),
      ),
    );
  }
}
