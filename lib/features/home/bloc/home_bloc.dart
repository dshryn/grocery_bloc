import 'package:bloc/bloc.dart';
import 'package:grocery_bloc/data/groc_data.dart';
import 'package:grocery_bloc/features/home/models/product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInititalEvent());

    on<HomeNavigateToWishlistClickedEvent>(
        homeNavigateToWishlistClickedEvent());

    on<HomeNavigateToCartClickedEvent>(homeNavigateToCartClickedEvent());

    on<HomeAddToCartClickedEvent>(homeAddToCartClickedEvent());

    on<HomeAddToWishlistClickedEvent>(homeAddToWishlistClickedEvent());
  }

  EventHandler<HomeInitialEvent, HomeState> homeInititalEvent() {
    return (event, emit) {
      emit(HomeLoadingState());
      try {
        Future.delayed(Duration(seconds: 2), () {
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
