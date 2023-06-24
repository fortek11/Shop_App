import 'package:flutter/material.dart';
import 'package:prac_shop_app/providers/products.dart';
import 'package:prac_shop_app/screens/edit_product_stateful.dart';
import 'package:provider/provider.dart';
class ManageProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String prodId;
  ManageProductItem(this.title,this.imageUrl,this.prodId);

  @override
  Widget build(BuildContext context) {
    final prodData = Provider.of<Products>(context);
    return Card(
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min
          ,
        children: [
          IconButton(onPressed: (){
           showModalBottomSheet(context: context,useRootNavigator: true,isScrollControlled: true, builder: (context){
            
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){},
              child: EditProduct(prodId),
            );

           });



          }, icon: Icon(Icons.edit),color: Theme.of(context).colorScheme.primary,),
          VerticalDivider(),
          IconButton(onPressed: (){
            showDialog(context: context, builder: (context){return
              AlertDialog(
                icon: CircleAvatar(child: Icon(Icons.delete_outline_rounded,color: Colors.deepPurple,size: 30,)),
                title: Text("Do You want to Delete the product?",style: TextStyle(fontSize: 20),),
               actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No")),
                   ElevatedButton(onPressed: (){prodData.deleteProduct(prodId);Navigator.of(context).pop();
                   ScaffoldMessenger.of(context).clearSnackBars();
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product Deleted!',style: TextStyle(color: Color.fromARGB(255, 232, 219, 255)),),backgroundColor: Theme.of(context).colorScheme.primary,));
                   }, child: Text("Yes!",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary),),
                   
                  ],
                )
               ],
              );
            });
            
          }, icon: Icon(Icons.delete),color: Theme.of(context).colorScheme.primary,),
        ]),
      )
    );
  }
}