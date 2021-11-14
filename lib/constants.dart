import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  static const String API_ENDPOINT = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';
  static const String defaultFont = 'GothamBlack';
  static const Color rowColor = Color(0xff221234);
  static const Color backgroundColor = Color(0xff562d82);
  static const Color titleColor = Color(0xffda4785);
  static const MaterialColor primaryColor = MaterialColor(
      0xff3A0F68,
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
      color: Constants.titleColor,
      fontSize: 17.0,
      fontStyle: FontStyle.italic
  );
  static const TextStyle defaultGenreFont = TextStyle(
      color: Constants.titleColor,
      fontSize: 17.0,
      fontStyle: FontStyle.italic
  );
}