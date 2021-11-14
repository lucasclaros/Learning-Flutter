import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieApi {
  static Future getMovies() async {
    return http.get(Uri.parse("https://desafio-mobile.nyc3.digitaloceanspaces.com/movies"));
  }
  static Image getImageMovie(String url){
    return Image.network(
      url,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
            return CupertinoActivityIndicator();
      },
    );
  }
}