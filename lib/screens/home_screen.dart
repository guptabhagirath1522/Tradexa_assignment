import 'package:app_assignment/components/movie_card.dart';
import 'package:app_assignment/components/search_bar.dart';
import 'package:app_assignment/providers/movie_search_provider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    //add post frame callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieSearchProvider>(context, listen: false)
          .getPopularMovies();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: CustomSearchBar(),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Consumer<MovieSearchProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (provider.movies.isEmpty) {
                  return const Center(child: Text('No results found.'));
                } else {
                  return ListView.builder(
                    itemCount: provider.movies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: MovieCard(movie: provider.movies[index]),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
