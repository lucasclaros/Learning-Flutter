import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MovieView extends StatefulWidget {
  final int movieId;
  const MovieView({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.movieId.toString()),
      ),
    );
  }
}
