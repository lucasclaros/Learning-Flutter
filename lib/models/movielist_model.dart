// To parse this JSON data, do
//
//     final movie = movieListFromJson(jsonString);
import 'dart:convert';
List<MoviesList> movieListFromJson(String str) => List<MoviesList>.from(json.decode(str).map((x) => MoviesList.fromJson(x)));

class MoviesList {
  MoviesList({
    required this.id,
    required this.voteAverage,
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.releaseDate,
  });

  int id;
  double voteAverage;
  String title;
  String posterUrl;
  List<String> genres;
  DateTime releaseDate;

  factory MoviesList.fromJson(Map<String, dynamic> json) => MoviesList(
    id: json["id"],
    voteAverage: json["vote_average"].toDouble(),
    title: json["title"],
    posterUrl: json["poster_url"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    releaseDate: DateTime.parse(json["release_date"]),
  );
}
