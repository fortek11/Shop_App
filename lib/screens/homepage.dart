import 'package:flutter/material.dart';
import 'package:prac_shop_app/providers/products.dart';
import 'package:prac_shop_app/screens/cart_screen.dart';
import 'package:prac_shop_app/screens/product_detail.dart';
import 'package:prac_shop_app/widgets/badge.dart';
import 'package:prac_shop_app/widgets/main_drawer.dart';

import 'package:prac_shop_app/widgets/product_grid.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';


enum Filters { ShowAll, ShowFav }



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listData = Provider.of<Products>(context, listen: false);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('MyShopApp'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Show All'),
                value: Filters.ShowAll,
              ),
              PopupMenuItem(
                child: Text('Show Fav'),
                value: Filters.ShowFav,
              ),
            ],
            onSelected: (Filters value) {
              if (value == Filters.ShowAll) {
                listData.becomeShowAll();
              } else {
                listData.becomeShowFav();
              }
            },
          ),
          Consumer<Cart>(
            builder: (context, cartt, ch) => BadgeWidget(
              value: cartt.itemsLength().toString(),
              child: ch!,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_bag),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: ProductGrid(),
      
    );
  }
}
