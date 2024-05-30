import 'package:flutter/foundation.dart';
import 'package:flutter_5iw1/core/models/cart_line.dart';
import 'package:flutter_5iw1/core/models/product.dart';
import 'package:flutter_5iw1/core/services/cart_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<CartInitialized>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));

      try {
        await CartServices.init();
        add(CartItemsLoaded());
      } catch (error) {
        emit(state.copyWith(status: CartStatus.error, errorMessage: 'An error occurred'));
      }
    });

    on<CartItemsLoaded>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));

      try {
        final items = await CartServices.getCartItems();
        emit(state.copyWith(status: CartStatus.success, items: items));
      } catch (error) {
        emit(state.copyWith(status: CartStatus.error, errorMessage: 'An error occurred'));
      }
    });

    on<CartItemAdded>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));

      try {
        final items = await CartServices.addToCart(product: event.product, quantity: event.quantity);
        emit(state.copyWith(status: CartStatus.success, items: items));
      } catch (error) {
        emit(state.copyWith(status: CartStatus.error, errorMessage: 'An error occurred'));
      }
    });

    on<CartItemRemoved>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));

      try {
        final items = await CartServices.removeFromCart(product: event.product);
        emit(state.copyWith(status: CartStatus.success, items: items));
      } catch (error) {
        emit(state.copyWith(status: CartStatus.error, errorMessage: 'An error occurred'));
      }
    });

    on<CartCleared>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));

      try {
        await CartServices.clearCart();
        emit(state.copyWith(status: CartStatus.success, items: []));
      } catch (error) {
        emit(state.copyWith(status: CartStatus.error, errorMessage: 'An error occurred'));
      }
    });
  }
}
