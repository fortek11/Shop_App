import 'package:flutter/material.dart';
import 'package:prac_shop_app/widgets/cart_item_widget.dart';
import 'package:prac_shop_app/widgets/stpper.dart';

import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cartscreen';

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: true);
    final cartDataKeys = cartData.items.keys.toList();
    final cartDataValues = cartData.items.values.toList();
     final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
         
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return CartItemWidget(
                  cartDataValues[index].title,
                  cartDataValues[index].id,
                  cartDataValues[index].price,
                  cartDataKeys[index],
                  cartDataValues[index].quantity);
            },
            itemCount: cartData.itemsLength(),
            padding: EdgeInsets.all(5),
          )),
        
        ],
      ),
        floatingActionButton:  FloatingActionButton.extended(
          label: Text('Order Now'),
          isExtended: true,
              
                  
                onPressed: () {
               
                orderData.addOrder(cartDataValues, cartData.totalPrice());
                cartData.clear();




                  ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:  Text("Order Placed Successfully!",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                backgroundColor: Color.fromARGB(255, 215, 189, 255),
              ));
                },
                tooltip: 'Create',
                icon: Icon(Icons.shopping_cart_checkout_rounded),
              ),
            
        floatingActionButtonLocation:  FloatingActionButtonLocation.endDocked,
      bottomNavigationBar:  BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Theme.of(context).colorScheme.primary,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Total:',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                Chip(
                  
                  label: Text(
                    '\$${cartData.totalPrice()}',
                    style: TextStyle(color: Colors.deepPurple,fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Color.fromARGB(255, 215, 189, 255),
                ),
                SizedBox(width: 180,)
          
              ],
            ),
      ),
      ),
      
    );
  }
}
