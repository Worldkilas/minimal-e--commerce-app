import 'package:flutter/material.dart';
import 'package:minimal_e_commerce/models/shop.dart';
import 'package:minimal_e_commerce/screens/cart_screen.dart';
import 'package:minimal_e_commerce/screens/intro_screen.dart';
import 'package:minimal_e_commerce/screens/shop_screen.dart';
import 'package:minimal_e_commerce/themes/light_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Shop(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroScreen(),
        '/shop_screen': (context) => const ShopScreen(),
        '/cart_screen': (context) => const CartScreen()
      },
    );
  }
}
