

import 'package:flutter/material.dart';
import 'package:prac_shop_app/providers/cart.dart';
class OrderItem{
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime date;
  final int orderNo;

  OrderItem(this.id,this.amount,this.products,this.date,this.orderNo);
}

class Orders with ChangeNotifier{

int order = 0;
int orderNumber(){
  order = order+1;
  return order;
}
List<OrderItem> _items = [];
List<OrderItem> get items {
  return [..._items];
}

double totalSpent(){
  double total = 0;
  _items.forEach((element) {
    total += element.amount;

  });
  return total;
}

void addOrder(List<CartItem> products,double total){
  _items.insert(0, OrderItem(DateTime.now().toString(), total, products, DateTime.now(),orderNumber()));
  notifyListeners();
}

}