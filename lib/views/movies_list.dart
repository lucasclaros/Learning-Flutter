import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/views/movie_row.dart';

class MovieList extends StatefulWidget {
  final List movieList;
  const MovieList({Key? key, required this.movieList}) : super(key: key);
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Center(child: Text("Top 20 Movies")),
        ),
        body: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics (),
          cacheExtent: (1920 / (MediaQuery.of(context).size.height)) * 180 * 20,
          itemCount: widget.movieList.length,
          itemBuilder: (context, index) {
            return MovieRow(movieList: widget.movieList, index: index);
          }
        )
    );
  }
}