import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste/constants.dart';
import 'package:teste/models/imdbimage_model.dart';
import 'package:teste/models/movie_model.dart';
import 'package:teste/models/movielist_model.dart';
import 'package:teste/views/movieslist_view.dart';
import 'package:teste/views/selectedmovie_view.dart';

class MovieApi {
  static Future<http.Response?> getResponse(String url) async {
    try{
      return await http.get(Uri.parse(url));
    }catch(e){
      return null;
    }
  }
}

class MovieImage extends StatelessWidget {
  final String url;
  final String? id;
  const MovieImage({Key? key, required this.url, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: url,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Center(child: CircularProgressIndicator(),),//Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjyP81gRzjbnhyMXKVerbBhW0rF81d20JiUBEdYZFhqTw5evgXWZPCPBYaucb5Csm8W58&usqp=CAU'), //Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjyP81gRzjbnhyMXKVerbBhW0rF81d20JiUBEdYZFhqTw5evgXWZPCPBYaucb5Csm8W58&usqp=CAU')
    );
  }
}

class GetImdbImage extends StatelessWidget {
  final String? id;
  const GetImdbImage({Key? key, this.id}) : super(key: key);

  Future<ImdbImages> getImdbImages() async {
    final response = await MovieApi.getResponse(Constants.API_ENDPOINT+'/'+id.toString());
    Movie movie = movieFromJson(response!.bodyBytes);
    final responseImdb = await MovieApi.getResponse(Constants.API_IMDB_POSTERS+'/'+movie.imdbId.toString());
    return imdbImageFromJson(responseImdb!.body);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <ImdbImages>(
        future: getImdbImages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CachedNetworkImage(
              imageUrl: snapshot.data!.backdrops[0].link.toString(),
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}', style: const TextStyle(fontSize: 18),),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
  }
}

class GetMoviesList extends StatefulWidget {
  const GetMoviesList({Key? key}) : super(key: key);

  @override
  _GetMoviesListState createState() => _GetMoviesListState();
}

class _GetMoviesListState extends State<GetMoviesList> {

  List<MoviesList> movieList = <MoviesList>[];

  Future<List<MoviesList>?> getMoviesList() async {
    try{
      final response = await MovieApi.getResponse(Constants.API_ENDPOINT);
      setState(() {
        movieList = movieListFromJson(response!.body);
      });
      return movieList;
    }catch(e){
      Text(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundRowColor,
      body: FutureBuilder <List<MoviesList>?>(
        future: getMoviesList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MoviesListPage(movieList: movieList);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}', style: const TextStyle(fontSize: 18),),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}


class GetSelectedMovie extends StatefulWidget {
  final int movieId;
  const GetSelectedMovie({Key? key, required this.movieId}) : super(key: key);

  @override
  _GetSelectedMovie createState() => _GetSelectedMovie();
}

class _GetSelectedMovie extends State<GetSelectedMovie> {
  late Movie movie;

  Future<Movie> getSelectedMovie() async {
    final response = await MovieApi.getResponse(Constants.API_ENDPOINT+'/'+widget.movieId.toString());
    setState(() {
      movie = movieFromJson(response!.bodyBytes);
    });
    return movie;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundRowColor,
      body: FutureBuilder <Movie>(
        future: getSelectedMovie(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SelectedMovieView(movie: movie);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}', style: const TextStyle(fontSize: 10),),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

