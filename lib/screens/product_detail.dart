import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prac_shop_app/providers/cart.dart';
import 'package:prac_shop_app/providers/products.dart';
import 'package:provider/provider.dart';

import '../widgets/alertWidget.dart';

class ProductDetail extends StatelessWidget {
  final String id;
  ProductDetail(this.id);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);
    final cartData = Provider.of<Cart>(context, listen: false);
    final selectedProduct = products.items.firstWhere(
      (element) => element.id == id,
    );
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios))
          ],
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(selectedProduct.imageUrl))),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            selectedProduct.title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          selectedProduct.description,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          width: 300,
          child: ElevatedButton(
            onPressed: () {
              cartData.addToCart(selectedProduct.id, selectedProduct.title,
                  selectedProduct.price);

              Navigator.of(context).pop();
               showDialog(context: context, builder: (context){
                            return DialogFb1();
                          });
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text("Product Added To Bag!"),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ));

              //you can also add undo button to the snackbar using 'actions' and 'SnackBarAction'
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                elevation: 10,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                shadowColor: Colors.black,
                surfaceTintColor: Colors.pink,
                animationDuration: const Duration(microseconds: 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      'Add To Bag ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
                Row(
                  children: [
                    const VerticalDivider(
                      color: Colors.white,
                    ),
                    Text(
                      '\$${selectedProduct.price}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
