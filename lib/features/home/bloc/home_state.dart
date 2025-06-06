part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingFailureState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeAppendWishlistActionState extends HomeActionState {}

class HomeAppendCartActionState extends HomeActionState {}

class HomeRemoveFromWishlistActionState extends HomeActionState {
  final ProductDataModel removedProduct;

  HomeRemoveFromWishlistActionState({required this.removedProduct});
}

class HomeRemoveFromCartActionState extends HomeActionState {
  final ProductDataModel removedProduct;

  HomeRemoveFromCartActionState({required this.removedProduct});
}
