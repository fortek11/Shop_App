import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/badge.dart';

import 'package:shop_app/widgets/productgrid.dart';

enum FilterOptions { Fav, all }

class ProductsOverview extends StatelessWidget {
  ProductsOverview({super.key});

  Widget build(BuildContext context) {
    final products = Provider.of<Productss>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Shop"),
          actions: [
            PopupMenuButton(
                onSelected: (FilterOptions value) {
                  if (value == FilterOptions.Fav) {
                    products.becomeShowFav();
                  } else {
                    products.becomeAll();
                  }
                },
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) => [
                      const PopupMenuItem(
                        child: Text('Only Fav'),
                        value: FilterOptions.Fav,
                      ),
                      const PopupMenuItem(
                        child: Text('Show All'),
                        value: FilterOptions.all,
                      ),
                    ]),
            Consumer<Cart>(
              builder: (_, value, ch) => BadgeWidgset(
                child: ch!,
                value: value.itemsLenght.toString(),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
              ),
            )
          ],
        ),
        body: ProductGrid());
  }
}
