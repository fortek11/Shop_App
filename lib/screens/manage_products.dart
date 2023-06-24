import 'package:flutter/material.dart';
import 'package:prac_shop_app/screens/add_product.dart';
import 'package:prac_shop_app/widgets/manage_product_item.dart';
import 'package:prac_shop_app/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
class ManageProducts extends StatelessWidget {
  static const routeName = 'manageproducts';

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<Products>(context);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text("Manage Products"),actions: [
        IconButton(onPressed: (){
          Navigator.of(context).pushNamed(AddPorduct.routeName);
        }, icon: Icon(Icons.add,grade: 20,))
      ],),
      body: Column(
        children: [
          ListView.builder(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),itemCount: productList.items.length,shrinkWrap: true,itemBuilder: (context,index){
            return ManageProductItem(productList.items[index].title, productList.items[index].imageUrl, productList.items[index].id);
          }),
        ],
      ),
    );
  }
}