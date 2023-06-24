

import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem(this.id, this.price, this.title, this.quantity);
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int itemsLength() {
    return _items.length;
  }

  double totalPrice() {
    double totalSum = 0;
    _items.forEach((key, value) {
      totalSum += value.price * value.quantity;
    });
    return totalSum;
  }

  void addToCart(String prodId, String title, double price) {
    if (_items.containsKey(prodId)) {
      _items.update(
          prodId,
          (value) =>
              CartItem(value.id, value.price, value.title, value.quantity + 1));
    } else {
      _items.putIfAbsent(
          prodId, () => CartItem(DateTime.now().toString(), price, title, 1));
    }
    notifyListeners();
  }

  void removeFromCart(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }
}
