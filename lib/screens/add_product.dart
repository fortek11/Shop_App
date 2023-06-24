import 'package:flutter/material.dart';
import 'package:prac_shop_app/providers/products.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
final _key = GlobalKey<FormState>();
class AddPorduct extends StatefulWidget {
  static const routeName = 'addProduct';
  const AddPorduct({super.key});

  

  @override
  State<AddPorduct> createState() => _AddPorductState();
}

class _AddPorductState extends State<AddPorduct> {
  late String title;
  late String imageUrl;
  late String description;
  late double price;
  bool isLoading = false;
  Widget build(BuildContext context) {
  final prodcuctData =  Provider.of<Products>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Add Product"),),
      body: Form(key: _key,child: SingleChildScrollView(padding: EdgeInsets.symmetric(horizontal: 20),child: isLoading
      ?Center(
        heightFactor: 17,
        child: CircularProgressIndicator(),
      )
       : Column(children: [
        SizedBox(height: 15,),
        TextFormField(
          autofocus: true,
           validator: (value) {
    if (value == null||value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  },
          decoration: InputDecoration(labelText: 'Item Name:', hintText: 'Red Tie',border: OutlineInputBorder(),
          
          ),
        
        onChanged: (value) => title = value,
        onFieldSubmitted: (value) => title = value,
        textInputAction: TextInputAction.next,
        ),
        SizedBox(height: 15,),
        TextFormField(
           validator: (value) {
                  if (double.tryParse(value!) == null) {
                    return 'Please enter a valid number.';
                  }
                  
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number.';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero.';
                  }
                  return null;
                },
          
          decoration: InputDecoration(labelText: 'Item Price:', hintText: '0.0',border: OutlineInputBorder(),
          
          ),
          keyboardType: TextInputType.number,
        onChanged: (value) => price = double.parse(value),
        onFieldSubmitted: (value) => price = double.parse(value),
         textInputAction: TextInputAction.next,
        ),SizedBox(height: 15,),
        TextFormField(

           validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter an image URL.';
                        }
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'Please enter a valid URL.';
                        }
                        if (!value.endsWith('.png') &&
                            !value.endsWith('.jpg') &&
                            !value.endsWith('.jpeg')) {
                          return 'Please enter a valid image URL.';
                        }
                        return null;
                      },
          decoration: InputDecoration(labelText: 'ImageURL', hintText: 'fortek.in/image',border: OutlineInputBorder(),
          
          ),
          
          keyboardType: TextInputType.url,
        onChanged: (value) => imageUrl = value,
        onFieldSubmitted: (value) => imageUrl = value,
         textInputAction: TextInputAction.next,
        ),SizedBox(height: 15,),
        TextFormField(
           validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description.';
                  }
                  if (value.length < 10) {
                    return 'Should be at least 10 characters long.';
                  }
                  return null;
                },
          decoration: InputDecoration(labelText: 'Item Description', hintText: 'Its a Great Product',border: OutlineInputBorder(),
          
          ),
          keyboardType: TextInputType.multiline,
        onChanged: (value) => description = value,
        onFieldSubmitted: (value) => description = value,
        maxLines: 3,
         textInputAction: TextInputAction.next,
        ),
    
    
      ],))),
      bottomNavigationBar: Container(margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),child: ElevatedButton(onPressed: (){
        
         if (_key.currentState!.validate()) {
          setState(() {
            isLoading = true;
          });
                  // If the form is valid, it will run the proccess. In the real world,
                  // you'd often call a server or save the information in a database.
                  prodcuctData.AddProduct(DateTime.now().toString(), title, imageUrl, description, price).catchError((err){
                    return showDialog(context: context, builder: (ctx){
                      return AlertDialog(
                        content: Text('There Was an error'+err.toString()),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(ctx).pop();
                            Navigator.of(context).pop();
                          }, child: Text('OK'))
                        ],
                      );
                    });
                  }) .then((value){
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.of(context).pop();
                  });
                }
      }, child: Text('Submit'
      ,style: TextStyle(color: Colors.white.withOpacity(0.7)),),style: ElevatedButton.styleFrom(
        
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        
      ),),)
    );
  }
}