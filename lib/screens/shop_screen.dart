import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_e_commerce/models/shop.dart';
import 'package:minimal_e_commerce/widgets/my_drawer.dart';
import 'package:minimal_e_commerce/widgets/my_product_tile.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(' Shop page'),
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //go to cart screen
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_screen'),
                icon: const Icon(
                  Icons.shopping_cart,
                ))
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        drawer: const MyDrawer(),
        body: ListView(
          children: [
            //shop title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  "Pick from a variety of premium products ",
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ),
            ),
            //shop subtitle

            //product list
            SizedBox(
              height: 530,
              child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    //get individual products from shop
                    final individualProduct = products[index];

                    //return a product tile UI for each product
                    return MyProductTile(product: individualProduct);
                  }),
            ),
          ],
        ));
  }
}
