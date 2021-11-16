// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);
import 'dart:convert';
ImdbImages movieFromJson(String str) => ImdbImages.fromJson(json.decode(str));

class ImdbImages {
  final posters;
  final backdrops;

  ImdbImages({
    this.posters,
    this.backdrops,
  });



  factory ImdbImages.fromJson(Map<String, dynamic> json) => ImdbImages(
    posters: List<Backdrop>.from(json["posters"].map((x) => Backdrop.fromJson(x))),
    backdrops: List<Backdrop>.from(json["posters"].map((x) => Backdrop.fromJson(x))),
  );
}

class Backdrop {
  Backdrop({
    this.link,
    this.width,
    this.height,
  });

  final link;
  final width;
  final height;

  factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
    link: json["link"]!,
    width: json["width"]!,
    height: json["height"]!,
  );
}
