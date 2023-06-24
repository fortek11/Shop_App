import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;

  final double price;
  final String description;
  bool isFav;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.isFav = false,
  });

  void toogleFav() {
    isFav = !isFav;
    notifyListeners();
  }
  
}
