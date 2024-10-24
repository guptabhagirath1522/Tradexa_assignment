import 'dart:ffi';

class Movie {
  final String title;
  final String overview;
  final String posterUrl;
  final double rating;
  final List<int> genres;

  Movie({
    required this.title,
    required this.overview,
    required this.posterUrl,
    required this.rating,
    required this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'No Title',
      overview: json['overview'] ?? 'No Overview',
      posterUrl: json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${json['poster_path']}'
          : 'https://via.placeholder.com/150',
      rating: json['vote_average']?.toDouble() ?? 0.0,
      genres: (json['genre_ids'] as List).map((e) => e as int).toList(),
    );
  }
}
