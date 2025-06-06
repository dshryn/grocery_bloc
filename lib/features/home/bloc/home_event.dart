part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeAddToCartClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeAddToCartClickedEvent({required this.clickedProduct});
}

class HomeAddToWishlistClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeAddToWishlistClickedEvent({required this.clickedProduct});
}

class HomeRemoveFromWishlistClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeRemoveFromWishlistClickedEvent({required this.clickedProduct});
}

class HomeRemoveFromCartClickedEvent extends HomeEvent {
  final ProductDataModel clickedProduct;

  HomeRemoveFromCartClickedEvent({required this.clickedProduct});
}

class HomeNavigateToWishlistClickedEvent extends HomeEvent {}

class HomeNavigateToCartClickedEvent extends HomeEvent {}
