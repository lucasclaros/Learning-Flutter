class Movie
{
  int id;
  double average;
  String title;
  String posterUrl;
  DateTime date;
  List<String> genres;

  Movie.fromJson(Map json)
    : id = json['id'],
      title = json['title'],
      posterUrl = json['poster_url'],
      average = json['vote_average'],
      genres = json['genres'].cast<String>(),
      date = DateTime.parse(json['release_date']);

  Map toJson()
  {
    return {'id': id, 'title': title, 'poster_url': posterUrl, 'vote_average': average, 'genres': genres, 'release_date': date};
  }
}