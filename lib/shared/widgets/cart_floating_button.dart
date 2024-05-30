import 'package:flutter/material.dart';
import 'package:flutter_5iw1/cart/cart_screen.dart';

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => CartScreen.navigateTo(context),
      child: const Icon(Icons.shopping_cart),
    );
  }
}
