import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_e_commerce/widgets/my_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            const Icon(
              Icons.shopping_bag,
              size: 70,
            ),
            //title
            Text(
              "Fareed's Shop",
              style: GoogleFonts.bebasNeue(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),

            //subtitle
            Text(
              "Elevate your shopping game",
              style: GoogleFonts.bebasNeue(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 15,
            ),

            //button
            Button(
                label: 'Shop now',
                onTap: () => Navigator.pushNamed(context, '/shop_screen'))
          ],
        ),
      ),
    );
  }
}
