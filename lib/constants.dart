import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  static const String API_ENDPOINT = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';
  static const String IMDB_APIKEY = 'k_34t7z46e';
  static const String API_IMDB_POSTERS = 'https://imdb-api.com/en/API/Posters/'+IMDB_APIKEY;
  static const String defaultFont = 'GothamBlack';
  static const Color borderRowColor = Color(0xff0e0e0e);
  static const Color backgroundRowColor = Color(0xff292929);
  static const Color starListColor = Colors.red;
  static const Color titleListColor = Colors.amber;
  static const MaterialColor primaryColor = MaterialColor(
      0xffdd1313,
      <int, Color> {
        50 : Color(0xff3A0F68),
        100: Color(0xff3A0F68),
        200: Color(0xff3A0F68),
        300: Color(0xff3A0F68),
        400: Color(0xff3A0F68),
        500: Color(0xff3A0F68),
        600: Color(0xff3A0F68),
        700: Color(0xff3A0F68),
        800: Color(0xff3A0F68),
        900: Color(0xff3A0F68),
      });

  static const TextStyle titleFontStyle = TextStyle(
      color: Constants.titleListColor,
      fontSize: 17.0,
      fontStyle: FontStyle.italic
  );
  static const TextStyle selectedMovieTitleStyle = TextStyle(
      color: Constants.titleListColor,
      fontSize: 20.0,
      fontStyle: FontStyle.italic
  );

  static const TextStyle genreFontStyle = TextStyle(
      color: Colors.white,
      fontSize: 14.0,
      fontFamily: 'Rimouski',
      fontStyle: FontStyle.italic
  );

  static const TextStyle selectedMovieFontStyle = TextStyle(
    color: Colors.white,
    fontSize: 17.0,
    fontFamily: 'Rimouski',
  );
}