import 'package:flutter/material.dart';
import 'package:grocery_bloc/features/home/ui/home_pg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePg(),
    );
  }
}
