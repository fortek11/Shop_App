import 'package:flutter/material.dart';
import 'package:prac_shop_app/providers/products.dart';
import 'package:provider/provider.dart';
final _form = GlobalKey<FormState>();
class EditProduct extends StatefulWidget {
  final String id;
  EditProduct(this.id);
  

  @override
  State<EditProduct> createState() => _EditProductState();
}
class _EditProductState extends State<EditProduct> {

  
  @override
  
  Widget build(BuildContext context) {
    final selectedProduct = Provider.of<Products>(context,listen: false).selectById(widget.id);
    final edit = Provider.of<Products>(context,listen: false);
    String editingTitle = selectedProduct.title;
    String editingSec = selectedProduct.description;
    double editingPrice = selectedProduct.price;
    String edditingImage = selectedProduct.imageUrl;
    
    
    return Padding(padding:
    EdgeInsets.only(top: 1,left: 20,right: 20,bottom: MediaQuery.of(context).viewInsets.bottom),
    child: Form(
      key: _form,
     child: SingleChildScrollView(child: Column(mainAxisSize: MainAxisSize.max,
     children: [
       SizedBox(
          height: 10,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
                Text('Edit Product',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
              
          ],
        ),
        TextFormField(
          initialValue: selectedProduct.title,
          decoration: InputDecoration(label: Text("Title"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          textInputAction: TextInputAction.next,
          onChanged: (value) => editingTitle = value,
          onFieldSubmitted: (value) => editingTitle = value,
        ),
        SizedBox(height: 10,),
         TextFormField(
          initialValue: selectedProduct.price.toString(),
          decoration: InputDecoration(label: Text("Price"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          onChanged: (value) => editingPrice = double.parse(value),
          onFieldSubmitted: (value) => editingPrice = double.parse(value),
        ),
         SizedBox(height: 10,),
         TextFormField(
          initialValue: selectedProduct.description,
          decoration: InputDecoration(label: Text("Description"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          maxLines: 3,
          keyboardType: TextInputType.multiline,
          onChanged: (value) => editingSec = value,
          onFieldSubmitted: (value) => editingSec = value,
         
        ),
         SizedBox(height: 10,),
           TextFormField(
          initialValue: selectedProduct.imageUrl,
          decoration: InputDecoration(label: Text("ImageURL"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          maxLines: 3,
          keyboardType: TextInputType.url,
          onChanged: (value) => edditingImage = value,
          onFieldSubmitted: (value) => edditingImage = value,
         
        ),
       
 
        SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal:20),
              child: IconButton(icon: CircleAvatar(maxRadius: 30,child: Icon(Icons.arrow_forward_rounded,color: Colors.deepPurple,size: 40,)),
              onPressed: (){
                if (_form.currentState!.validate()) {
                edit.editProduct(editingTitle, editingSec, editingPrice , widget.id ,edditingImage);}
              },color: Colors.deepPurple,splashColor: Colors.deepPurple,),
            )
          ],
        ),
        SizedBox(height: 40,),
     
    ]),
    
    ),
    
    ),
    
    );
  
  }

}