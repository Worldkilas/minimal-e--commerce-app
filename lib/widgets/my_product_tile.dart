import 'package:flutter/material.dart';
import 'package:minimal_e_commerce/models/product.dart';
import 'package:minimal_e_commerce/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  const MyProductTile({super.key, required this.product});
  final Product product;

  //add to cart button pressed
  void addToCart(BuildContext context) {
    // show dialog box to ask to add to cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Add this item to your cart?'),
              actions: [
                //cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                //yes button
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //add to cart
                    context.read<Shop>().addItemToCart(product);
                  },
                  child: const Text('Yes'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 250,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                //product image
                AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12)),
                      width: double.infinity,
                      padding: const EdgeInsets.all(25),
                      child: Image.asset(
                        product.imagePath,
                        fit: BoxFit.cover,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                //product naem
                Text(
                  product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                //product description
                Text(
                  product.description,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),

            //product price+ add button to cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //product price
                Text('\$${product.price.toStringAsFixed(2)}'),
                //add to cart button
                Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)),
                    child: IconButton(
                        onPressed: () => addToCart(context),
                        icon: const Icon(Icons.add)))
              ],
            ),
          ]),
    );
  }
}
