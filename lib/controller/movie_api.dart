import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:teste/constants.dart';
import 'package:teste/models/movie.dart';
import 'package:teste/views/movies_list.dart';

class MovieApi {

  static getMovies() async {
    return http.get(Uri.parse(Constants.API_ENDPOINT));
  }

  static List<Movie> getApiMovies() {
    MovieApi.getMovies().then((response) {
      Iterable list = json.decode(response.body);
      List movieList = list.map((model) => Movie.fromJson(model)).toList();
      return movieList;
    });
    return [];
  }
}

class GetMovieList extends StatefulWidget {
  const GetMovieList({Key? key}) : super(key: key);

  @override
  _GetMovieListState createState() => _GetMovieListState();
}

class _GetMovieListState extends State<GetMovieList> {

  List<Movie> movieList = <Movie>[];

  Future<List<Movie>> getMoviesfromApi() async {
    final response = await MovieApi.getMovies();
      setState(() {
        Iterable list = json.decode(response.body);
        movieList = list.map((model) => Movie.fromJson(model)).toList();
      });
    return movieList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: FutureBuilder <List<Movie>>(
        future: getMoviesfromApi(), // a previously-obtained Future<String> or null
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MovieList(movieList: movieList);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}', style: TextStyle(fontSize: 18),),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/movie.json', repeat: true, frameRate: FrameRate(60)),
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class MovieImage extends StatelessWidget {
  final String url;
  const MovieImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
