import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MovieView extends StatefulWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
