import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:teste/data/movie_api.dart';
import 'package:teste/movie/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Movie> movieList = <Movie>[];

  void getMoviesfromApi() async {
    MovieApi.getMovies().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        movieList = list.map((model) => Movie.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getMoviesfromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Top 20 Movies"),
        ),
        body: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              return Column(
                children:
                [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Expanded(
                        flex: 3,
                        child:
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: SizedBox(
                                    width: 80,
                                    height: 160,
                                    child: MovieApi.getImageMovie(movieList[index].img)
                            ),
                          ),
                      ),
                      Expanded(
                          flex: 7,
                          child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                                  child: Expanded(
                                    child: Text(movieList[index].title + " ("+movieList[index].date.year.toString()+")",
                                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
                                    ),
                                  ),
                                ),
                                Row(
                                    children: [
                                      Expanded(child: Text(movieList[index].average.toString()))
                                    ],
                                )
                              ],
                          ),
                      ),
                    ],
                  )
                ],
              );
            }));
  }
}
