import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final String title;
  final String id;
  final int quantity;
  final double price;
  final String prodId;
  CartItemWidget(this.title, this.id, this.price, this.prodId, this.quantity);
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5),
      child: Dismissible(
        key: ValueKey(prodId),
        onDismissed: (direction) => cartData.removeFromCart(prodId),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(color: Colors.red),
          child: Icon(
            Icons.delete,
            size: 40,
            color: Colors.white,
          ),
          alignment: Alignment.centerRight,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: FittedBox(
                child: Text(
              '\$${price}',
              style: TextStyle(color: Colors.white),
            )),
          ),
          title: Text(title),
          subtitle: Text(
            'Total: \$${quantity * price}',
          ),
          trailing: Text('${quantity}*'),
        ),
      ),
    );
  }
}
