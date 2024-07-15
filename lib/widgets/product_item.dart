import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail..dart';

import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedProduct = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              icon: selectedProduct.isFavorite
                  ? Icon(
                      Icons.favorite,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : Icon(
                      Icons.favorite_border,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              onPressed: () {
                selectedProduct.toogleFav();
              },
            ),
          ),
          title: Text(
            selectedProduct.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black.withOpacity(0.5),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              cart.addToCart(selectedProduct.id, selectedProduct.price,
                  selectedProduct.title);
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: Text("Product Added to Cart!"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Ok"))
                      ],
                    );
                  });
            },
          ),
        ),
        child: InkWell(
          splashColor: Colors.black,
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetail.routeName,
                arguments: selectedProduct.id);
          },
          child: Image.network(
            selectedProduct.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
