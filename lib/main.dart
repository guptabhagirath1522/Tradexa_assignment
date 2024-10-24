import 'package:app_assignment/providers/movie_search_provider.dart';
import 'package:app_assignment/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieSearchProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //set font family
          fontFamily: 'Montserrat',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
