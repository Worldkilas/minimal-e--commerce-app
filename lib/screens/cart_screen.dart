import 'package:flutter/material.dart';
import 'package:minimal_e_commerce/models/product.dart';
import 'package:minimal_e_commerce/models/shop.dart';
import 'package:minimal_e_commerce/screens/empty_cart.dart';
import 'package:minimal_e_commerce/widgets/my_list_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //get access to cart
    final cart = context.watch<Shop>().cart;

    void removeFromCart(Product product) {
      context.read<Shop>().removeItemFromCart(product);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart Screen'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
              child: cart.isEmpty
                  ? const EmptyCartScreen()
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        //get individual items
                        final item = cart[index];

                        // return as a cart tile ui
                        return Dismissible(
                          direction: DismissDirection.startToEnd,
                          background: Container(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            alignment: Alignment.centerRight,
                            child: const Icon(Icons.delete_forever,
                                color: Colors.white, size: 50),
                          ),
                          onDismissed: (direction) {
                            removeFromCart(item);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('${item.name} deleted')));
                          },
                          key: UniqueKey(),
                          child: MyListTile(
                            leadingIcon: Icons.trolley,
                            text: item.name,
                            subtitle: item.price.toStringAsFixed(2),
                          ),
                        );
                      }))
        ],
      ),
    );
  }
}
