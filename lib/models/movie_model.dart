// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);
import 'dart:convert';
Movie movieFromJson(List<int> str) => Movie.fromJson(json.decode(utf8.decode(str)));

class Movie {
  final adult;
  final backdropUrl;
  final budget;
  final genres;
  final homepage;
  final id;
  final imdbId;
  final originalLanguage;
  final originalTitle;
  final overview;
  final popularity;
  final posterUrl;
  final releaseDate;
  final revenue;
  final runtime;
  final spokenLanguages;
  final status;
  final tagline;
  final title;
  final video;
  final voteAverage;
  final voteCount;

  Movie({
    this.adult,
    this.backdropUrl,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterUrl,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });



  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    adult: json["adult"],
    backdropUrl: json["backdrop_url"],
    budget: json["budget"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    homepage: json["homepage"],
    id: json["id"],
    imdbId: json["imdb_id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    posterUrl: json["poster_url"],
    releaseDate: DateTime.parse(json["release_date"]),
    runtime: json["runtime"],
    revenue: json["revenue"],
    spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
    status: json["status"],
    tagline: json["tagline"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );
}

class SpokenLanguage {
  SpokenLanguage({
    required this.iso6391,
    required this.name,
  });

  final String iso6391;
  final String name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
    iso6391: json["iso_639_1"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391,
    "name": name,
  };
}
