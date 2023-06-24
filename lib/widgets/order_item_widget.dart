import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prac_shop_app/providers/cart.dart';
import 'package:prac_shop_app/providers/orders.dart';
import 'package:intl/intl.dart';
class OrderWidget extends StatelessWidget {
  final OrderItem orderItem;

  OrderWidget(this.orderItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Card(
          elevation: 3,
          child: ExpansionTile(
            iconColor: Theme.of(context).colorScheme.primary,
            leading: Icon(Icons.local_shipping_rounded,color: Theme.of(context).colorScheme.primary,),
            title: Text('Delivered: Order No. ${orderItem.orderNo}',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
            subtitle: Row(children: [Text('${DateFormat.yMMMd().format(orderItem.date)} | Value: \$${orderItem.amount}')],),
            children: [
              SizedBox(height: 10,),
               ListView(
                padding: EdgeInsets.symmetric(horizontal:40 ),
                shrinkWrap: true,
                children:orderItem.products.map((e) => Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                   
                    children: [
                    
                      Text(e.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      
                      Text('\$${e.price} × ${e.quantity}*',textAlign: TextAlign.end,),
                      
                    ],
                  ),
                )).toList(),
               ),
               Divider(color: const Color.fromARGB(255, 24, 19, 38),endIndent: 25,indent: 25,),
               Container(padding: EdgeInsets.only(right: 50),alignment: Alignment.centerRight,child: Text('\$${orderItem.amount}',style: TextStyle(fontWeight: FontWeight.bold),) ,),
               SizedBox(height: 10)
            ],
           
          ),
        ),
      ),
    );
  }
}