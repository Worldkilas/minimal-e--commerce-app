import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
          child: Column(
        children: [
          Flexible(
              child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Lottie.asset('lib/animations/empty cart.json'),
          )),
          const Text(
            'Your cart is empty\n'
            'Tap the button below to browse the shop',
            textAlign: TextAlign.center,
          ),
          MaterialButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.black,
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/shop_screen'),
              child: Text(
                'Browse the shop',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ))
        ],
      )),
    );
  }
}
