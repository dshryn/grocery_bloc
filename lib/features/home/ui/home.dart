import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc/features/home/bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {},
      builder: (context, state) {
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
            child: Text('Welcome to the Grocery App!'),
          ),
        );
      },
    );
  }
}
