part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeAddToCartClickedEvent extends HomeEvent {}

class HomeAddToWishlistClickedEvent extends HomeEvent {}

class HomeNavigateToWishlistClickedEvent extends HomeEvent {}

class HomeNavigateToCartClickedEvent extends HomeEvent {}
