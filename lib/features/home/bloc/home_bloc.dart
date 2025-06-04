import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeNavigateToWishlistClickedEvent>(
        homeNavigateToWishlistClickedEvent());
    on<HomeNavigateToCartClickedEvent>(homeNavigateToCartClickedEvent());
    on<HomeAddToCartClickedEvent>(homeAddToCartClickedEvent());
    on<HomeAddToWishlistClickedEvent>(homeAddToWishlistClickedEvent());
  }

  FutureOr<void> Function(HomeNavigateToCartClickedEvent, Emitter<HomeState>)
      homeNavigateToCartClickedEvent() {
    return (event, emit) {
      emit(HomeNavigateToCartPageActionState());
    };
  }

  FutureOr<void> Function(
          HomeNavigateToWishlistClickedEvent, Emitter<HomeState>)
      homeNavigateToWishlistClickedEvent() {
    return (event, emit) {
      emit(HomeNavigateToWishlistPageActionState());
    };
  }

  EventHandler<HomeAddToWishlistClickedEvent, HomeState>
      homeAddToWishlistClickedEvent() {
    return (event, emit) {
      print('Add to Wishlist Clicked');
    };
  }

  EventHandler<HomeAddToCartClickedEvent, HomeState>
      homeAddToCartClickedEvent() {
    return (event, emit) {
      print('Add to Cart Clicked');
    };
  }
}
