import 'package:flutter/material.dart';
import 'package:minimal_e_commerce/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    Product(
      'lib/assets/noise cancelling headphones.jfif',
      name: 'Noise-Canceling Headphones',
      price: 199.99,
      description:
          'Immerse yourself in your music or podcasts with these wireless noise-canceling headphones...',
    ),
    Product(
      'lib/assets/portable espresso maker.jfif',
      name: 'Smart Fitness Tracker',
      price: 79.95,
      description:
          'Take control of your health goals with this smart fitness tracker...',
    ),
    Product(
      'lib/assets/smart fitness tracker.jfif',
      name: 'Portable Espresso Machine',
      price: 149.00,
      description:
          'Enjoy barista-quality coffee at home or on the go with this portable espresso machine...',
    ),
    Product(
      'lib/assets/waterproof action camera.jfif',
      name: 'Waterproof Action Camera',
      price: 249.50,
      description:
          'Capture all your adventures with this waterproof action camera...',
    ),
  ];
  //user cart
  final List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to the cart
  void addItemToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove an item from the cart
  void removeItemFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
