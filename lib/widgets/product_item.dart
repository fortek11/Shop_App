

import 'package:flutter/material.dart';
import 'package:prac_shop_app/providers/product.dart';
import 'package:prac_shop_app/screens/product_detail.dart';
import 'package:prac_shop_app/widgets/alertWidget.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

void showProductDetail(String id, BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: ProductDetail(id),
              ),
            ],
          ),
        );
      });
}

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedProduct = Provider.of<Product>(context, listen: false);
    final cartData = Provider.of<Cart>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 5,
                color: Colors.purple[100]!.withOpacity(0.5)),
          ]),
      child: GridTile(
        child: InkWell(
          onTap: () {
            showProductDetail(selectedProduct.id, context);
          },
          splashColor: Colors.black,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              selectedProduct.imageUrl,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
        footer: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Colors.white),
            height: 40,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Consumer<Product>(
                    builder: (context, value, child) => IconButton(
                      onPressed: () {
                        value.toogleFav();
                      },
                      icon: selectedProduct.isFav
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      color: const Color.fromARGB(255, 62, 35, 108),
                    ),
                  ),
                  SizedBox(
                      width: 77,
                      child: Text(
                        selectedProduct.title,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                        textAlign: TextAlign.center,
                      )),
                  IconButton(
                    onPressed: () {
                      cartData.addToCart(selectedProduct.id,
                          selectedProduct.title, selectedProduct.price);
                          showDialog(context: context, builder: (context){
                            return DialogFb1();
                          });

                   
                    },
                    icon: Icon(Icons.shopping_cart,
                        color: Color.fromARGB(255, 62, 35, 108)),
                  ),
                  // SizedBox(
                  //   width: 4,
                  // )
                ])),
      ),
    );
  }
}
