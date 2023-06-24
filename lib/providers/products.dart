

import 'package:flutter/material.dart';
import './product.dart';
import 'dart:convert';
import 'package:http/http.dart';
class Products with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
     Product(
      id: 'p5',
      title: 'Fortek',
      description: 'Wanna Buy the whole company?',
      price: 400,
      imageUrl:
          'https://fortek.in/wp-content/uploads/2022/11/tf-logo2.jpg',
    ),
  ];
  List<Product> get items {
    return [..._items];
  }

  List<Product> get favItems {
    return _items
        .where(
          (element) => element.isFav == true,
        )
        .toList();
  }

  bool showFavBool = false;
  void becomeShowFav() {
    showFavBool = true;
    notifyListeners();
  }

  void becomeShowAll() {
    showFavBool = false;
    notifyListeners();
  }

  int itemsLength() {
    return _items.length;
  }

  void deleteProduct(String id){
   _items.removeWhere((element) => element.id==id);
   notifyListeners();
  }

  Product selectById(String id){
    return _items.firstWhere((element) => element.id == id);

  }
  void editProduct(String title, String description,double price,String id,String imageUrl){
    deleteProduct(id);
    _items.add(Product(id: id, title: title, price: price, imageUrl: imageUrl, description: description));
    notifyListeners();
  }
  Future<void> AddProduct(String id,String title,String imageUrl,String description,double price){
    Uri url = Uri.https('shop-app-351d8-default-rtdb.asia-southeast1.firebasedatabase.app','productss.json');
    return post(url,body: json.encode({
      'title': title,
      'price': price,
      'imageUrl':imageUrl,
      'description':description,
      'isFav' : false,
    })).then((value) {
    

      print(value.body);  
     _items.add(Product(id: json.decode(value.body)["name"]!, title: title, price: price, imageUrl: imageUrl, description: description));
     print(_items.last.id);
    notifyListeners();
    }
    
    ).catchError((error){
     return error;  
    });
  }
}
