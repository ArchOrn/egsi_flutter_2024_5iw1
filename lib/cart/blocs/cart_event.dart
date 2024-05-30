part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartInitialized extends CartEvent {}

final class CartItemsLoaded extends CartEvent {}

final class CartItemAdded extends CartEvent {
  final Product product;
  final int quantity;

  CartItemAdded({required this.product, this.quantity = 1});
}

final class CartItemRemoved extends CartEvent {
  final Product product;

  CartItemRemoved({required this.product});
}

final class CartCleared extends CartEvent {}