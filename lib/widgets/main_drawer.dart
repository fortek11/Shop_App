import 'package:flutter/material.dart';
import 'package:prac_shop_app/screens/manage_products.dart';
import 'package:prac_shop_app/screens/order_screen.dart';
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
        child: Material(
          color: Theme.of(context).colorScheme.primary,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.shopify_outlined,color: Colors.white,size: 40,),
                          SizedBox(width: 10,),
                          Text('MyShop',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Divider(),
                    MenuItem(
                      text: 'Home',
                      icon: Icons.shopping_bag,
                      onClicked: () => selectedItem(context, 0),
                    ),
                    const SizedBox(height: 5),
                    MenuItem(
                      text: 'Orders',
                      icon: Icons.local_shipping_rounded,
                      onClicked: () => selectedItem(context, 1),
                    ),
                    const SizedBox(height: 5),
                     MenuItem(
                      text: 'Manage Products',
                      icon: Icons.edit_document,
                      onClicked: () => selectedItem(context, 2),
                    ),
                    const SizedBox(height: 5),
                   
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }



  void selectedItem(BuildContext context, int index) {
  
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacementNamed('/');
        break;
      case 1:
        Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
        break;
      case 2:
        Navigator.of(context).pushReplacementNamed(ManageProducts.routeName);
    }
  }
}
class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;
  
  const MenuItem({required this.text,
    required this.icon,
    this.onClicked,Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
