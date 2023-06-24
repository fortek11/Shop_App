import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prac_shop_app/providers/cart.dart';
import 'package:prac_shop_app/providers/orders.dart';
import 'package:prac_shop_app/providers/products.dart';
import 'package:prac_shop_app/screens/add_product.dart';
import 'package:prac_shop_app/screens/cart_screen.dart';
import 'package:prac_shop_app/screens/homepage.dart';
import 'package:prac_shop_app/screens/manage_products.dart';
import 'package:prac_shop_app/screens/order_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyShopApp());
}

class MyShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Orders())
      ],
      child: MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.poppinsTextTheme(),
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, secondary: Colors.amber)),
        home: HomePage(),
        routes: {
          CartScreen.routeName: (context) => CartScreen(),
          OrderScreen.routeName:(context) => OrderScreen(),
          ManageProducts.routeName:(context) => ManageProducts(),
          AddPorduct.routeName:(context) => AddPorduct(),
        },
      ),
    );
  }
}
