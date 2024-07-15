import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/product_detail..dart';
import 'package:shop_app/screens/products_overview_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import './providers/product_provider.dart';

void main(List<String> args) {
  runApp(ShopApp());
}

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Productss(),
        ),
        ChangeNotifierProvider(create: (context) => Cart())
      ],
      child: MaterialApp(
        theme: ThemeData(
             useMaterial3: true,
            textTheme: GoogleFonts.openSansTextTheme(),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple,
              secondary: Colors.deepOrange,
            )),
        title: 'MyShop',
        home: ProductsOverview(),
        routes: {
          ProductDetail.routeName: (context) => ProductDetail(),
          CartScreen.routeName: (context) => CartScreen(),
        },
      ),
    );
  }
}
