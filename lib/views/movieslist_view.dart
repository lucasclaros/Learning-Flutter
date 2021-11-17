import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/views/movie_row.dart';

class MoviesListPage extends StatefulWidget {
  final List movieList;
  const MoviesListPage({Key? key, required this.movieList}) : super(key: key);
  @override
  _MoviesListPageState createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Center(child: Text("Top 20 Movies", style: TextStyle(color: Colors.white),)),
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