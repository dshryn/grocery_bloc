import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:grocery_bloc/data/cart_items.dart';
import 'package:grocery_bloc/data/groc_data.dart';
import 'package:grocery_bloc/data/wishlist_items.dart';
import 'package:grocery_bloc/features/home/models/product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent());

    on<HomeNavigateToWishlistClickedEvent>(
        homeNavigateToWishlistClickedEvent());

    on<HomeNavigateToCartClickedEvent>(homeNavigateToCartClickedEvent());

    on<HomeAddToCartClickedEvent>(homeAddToCartClickedEvent());

    on<HomeAddToWishlistClickedEvent>(homeAddToWishlistClickedEvent());

    on<HomeRemoveFromWishlistClickedEvent>(
        homeRemoveFromWishlistClickedEvent());

    on<HomeRemoveFromCartClickedEvent>(homeRemoveFromCartClickedEvent());
  }

  EventHandler<HomeInitialEvent, HomeState> homeInitialEvent() {
    return (event, emit) async {
      emit(HomeLoadingState());
      try {
        await Future.delayed(Duration(seconds: 2), () {
          emit(HomeLoadedSuccessState(
              products: GrocData.grocProducts.map((e) {
            return ProductDataModel(
              id: e['id'],
              name: e['name'],
              price: e['price'],
              imageUrl: e['imageUrl'],
              description: e['description'],
            );
          }).toList()));
        });
      } catch (e) {
        emit(HomeLoadingFailureState());
      }
    };
  }

  EventHandler<HomeNavigateToWishlistClickedEvent, HomeState>
      homeNavigateToWishlistClickedEvent() {
    return (event, emit) {
      emit(HomeNavigateToWishlistPageActionState());
    };
  }

  EventHandler<HomeNavigateToCartClickedEvent, HomeState>
      homeNavigateToCartClickedEvent() {
    return (event, emit) {
      emit(HomeNavigateToCartPageActionState());
    };
  }

  EventHandler<HomeAddToWishlistClickedEvent, HomeState>
      homeAddToWishlistClickedEvent() {
    return (event, emit) {
      wishlistItems.add(event.clickedProduct);
      emit(HomeAppendWishlistActionState());
    };
  }

  EventHandler<HomeAddToCartClickedEvent, HomeState>
      homeAddToCartClickedEvent() {
    return (event, emit) {
      cartItems.add(event.clickedProduct);
      emit(HomeAppendCartActionState());
    };
  }

  EventHandler<HomeRemoveFromWishlistClickedEvent, HomeState>
      homeRemoveFromWishlistClickedEvent() {
    return (event, emit) {
      wishlistItems.remove(event.clickedProduct);
      emit(HomeRemoveFromWishlistActionState(
          removedProduct: event.clickedProduct));
    };
  }

  EventHandler<HomeRemoveFromCartClickedEvent, HomeState>
      homeRemoveFromCartClickedEvent() {
    return (event, emit) {
      cartItems.remove(event.clickedProduct);
      emit(HomeRemoveFromCartActionState(removedProduct: event.clickedProduct));
    };
  }
}
