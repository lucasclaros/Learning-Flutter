class Movie
{
  int id;
  double average;
  String title;
  String img;
  DateTime date;
  Object genres;

  Movie.fromJson(Map json)
    : id = json['id'],
      title = json['title'],
      img = json['poster_url'],
      average = json['vote_average'],
      genres = json['genres'],
      date = DateTime.parse(json['release_date']);

  Map toJson()
  {
    return {'id': id, 'title': title, 'poster_url': img, 'vote_average': average, 'genres': genres, 'release_date': date};
  }
}