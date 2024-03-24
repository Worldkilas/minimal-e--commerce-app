import 'package:flutter/material.dart';
import 'package:minimal_e_commerce/widgets/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Other pages
          Column(
            children: [
              //logo
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: 70,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              MyListTile(
                  leadingIcon: Icons.home,
                  text: 'Shop',
                  onTap: () => Navigator.pop(context)),
              MyListTile(
                leadingIcon: Icons.shopping_cart,
                text: 'Cart',
                onTap: () {
                  //pop drawer first
                  Navigator.pop(context);
                  //navigate to cart page
                  Navigator.pushNamed(context, '/cart_screen');
                },
              ),
            ],
          ),
          MyListTile(
            leadingIcon: Icons.logout,
            text: 'Exit',
            onTap: () {
              //pop drawer first
              Navigator.pop(context);
              //navigate to intro page
              Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
