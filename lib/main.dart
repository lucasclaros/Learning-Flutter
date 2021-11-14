import 'package:flutter/material.dart';
import 'constants.dart';
import 'controller/movie_api.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movies App",
      theme: ThemeData(
          primarySwatch: Constants.primaryColor,
          scaffoldBackgroundColor: Constants.backgroundColor,
          fontFamily: Constants.defaultFont,
      ),
      home: const GetMovieList(),
    );
  }
}