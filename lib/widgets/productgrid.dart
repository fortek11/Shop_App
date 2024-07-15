import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../providers/product_provider.dart';

class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Productss>(context);
    final loadedProductss = data.boolShowFav ? data.favItems : data.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProductss.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: loadedProductss[index],
            child: ProductItem(),
          );
        });
  }
}
