import 'package:flutter/material.dart';
import 'package:flutter_5iw1/cart/blocs/cart_bloc.dart';
import 'package:flutter_5iw1/cart/cart_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Hero(
          tag: 'cart_button',
          child: Stack(
            children: [
              FloatingActionButton(
                heroTag: null,
                onPressed: () => CartScreen.navigateTo(context),
                child: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      state.count.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
