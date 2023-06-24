import 'package:flutter/material.dart';
import 'package:prac_shop_app/providers/products.dart';
import 'package:provider/provider.dart';
import './product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: true);
    final products = productsData.showFavBool == false
        ? productsData.items
        : productsData.favItems;
    return GridView.builder(
        padding: EdgeInsets.all(15),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 1),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: products[index],
            child: ProductItem(),
          );
        });
  }
}
