import 'package:flutter/material.dart';
import 'package:prac_shop_app/widgets/main_drawer.dart';
import 'package:prac_shop_app/widgets/order_item_widget.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';


class OrderScreen extends StatelessWidget {
 static const routeName = 'orderscreen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context,listen: true);

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text("Orders"),actions: [
        Chip(label: Text('Spent: \$${orderData.totalSpent().toString()}',style: TextStyle(color: Colors.white),),backgroundColor: Theme.of(context).primaryColor.withOpacity(1),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        SizedBox(width: 20,)
      ],),
      body: ListView.builder(padding: EdgeInsets.symmetric(horizontal: 10),itemBuilder: (context,i){
        return OrderWidget(orderData.items[i]);
      },itemCount: orderData.items.length,),
    );
  }
}