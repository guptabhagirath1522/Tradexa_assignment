import 'dart:convert';
import 'package:app_assignment/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MovieSearchProvider with ChangeNotifier {
  List<Movie> _movies = [];
  bool _isLoading = false;

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  Future<void> searchMovies(String query) async {
    _isLoading = true;
    notifyListeners();

    final url =
        'https://api.themoviedb.org/3/search/movie?query=$query&include_adult=false&language=en-US&page=1';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYWY4NmRhZGM1NTNlYmI5MGFiNmQ1MzM0MjVhOTk0OCIsIm5iZiI6MTcyOTczNzU4MC42MjkyODYsInN1YiI6IjY1ZWIxNmVmZTYyNzE5MDE3YzViNzVjNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q9w_jP2KBDYAcPSsftnHxTM1rAUrK0E-P3LgZt-3Pkw'
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['results'] != null) {
        _movies = (data['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
      } else {
        _movies = [];
      }
    } else {
      _movies = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getPopularMovies() async {
    _isLoading = true;
    notifyListeners();

    const url =
        'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYWY4NmRhZGM1NTNlYmI5MGFiNmQ1MzM0MjVhOTk0OCIsIm5iZiI6MTcyOTczNzU4MC42MjkyODYsInN1YiI6IjY1ZWIxNmVmZTYyNzE5MDE3YzViNzVjNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q9w_jP2KBDYAcPSsftnHxTM1rAUrK0E-P3LgZt-3Pkw'
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['results'] != null) {
        _movies = (data['results'] as List)
            .map((movie) => Movie.fromJson(movie))
            .toList();
      } else {
        _movies = [];
      }
    } else {
      _movies = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
