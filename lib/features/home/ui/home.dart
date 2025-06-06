import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc/features/cart/ui/cart.dart';
import 'package:grocery_bloc/features/home/bloc/home_bloc.dart';
import 'package:grocery_bloc/features/home/ui/product_tile.dart';
import 'package:grocery_bloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeAppendCartActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Carted')));
        } else if (state is HomeAppendWishlistActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Wishlisted')));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Groceries'),
              backgroundColor: const Color.fromARGB(255, 129, 230, 171),
              actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToWishlistClickedEvent());
                    },
                    icon: Icon(Icons.favorite_outline_rounded)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToCartClickedEvent());
                    },
                    icon: Icon(Icons.shopping_cart_outlined)),
              ],
            ),
            body: const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 129, 230, 171),
              ),
            ),
          );
        } else if (state is HomeLoadingFailureState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Groceries'),
              backgroundColor: const Color.fromARGB(255, 129, 230, 171),
              actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToWishlistClickedEvent());
                    },
                    icon: Icon(Icons.favorite_outline_rounded)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToCartClickedEvent());
                    },
                    icon: Icon(Icons.shopping_cart_outlined)),
              ],
            ),
            body: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error,
                    size: 48,
                    color: Colors.red,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Error!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is HomeLoadedSuccessState) {
          final successState = state;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Groceries'),
              backgroundColor: const Color.fromARGB(255, 129, 230, 171),
              actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToWishlistClickedEvent());
                    },
                    icon: Icon(Icons.favorite_outline_rounded)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeNavigateToCartClickedEvent());
                    },
                    icon: Icon(Icons.shopping_cart_outlined)),
              ],
            ),
            body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(
                      homeBloc: homeBloc,
                      productDataModel: successState.products[index]);
                }),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
