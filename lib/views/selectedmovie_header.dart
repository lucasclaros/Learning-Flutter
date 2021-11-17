import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:teste/controller/movie_api.dart';

import '../constants.dart';

class SelectedMovieHeader extends SliverPersistentHeaderDelegate {

  SelectedMovieHeader({
    required this.expandedHeight,
    required this.backdropUrl,
    required this.posterUrl,
    required this.title,
    required this.movieYear,
  });

  final double expandedHeight;
  final String backdropUrl;
  final String posterUrl;
  final String title;
  final String movieYear;

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    const double posterHeight = 225;
    const double posterWidth = 150;
    final top = expandedHeight/2 - shrinkOffset;
    final left = (MediaQuery.of(context).size.width - posterWidth)/2;
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        buildAppbar(shrinkOffset),
        buildImagePoster(
          shrinkOffset,
          top, left,
          posterWidth, posterHeight,
          title, movieYear,
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;
  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppbar(double shrinkOffset) => AppBar(
    flexibleSpace: MovieImage(url: backdropUrl),
    foregroundColor: Colors.amber,
    actions: const [
      Icon(Icons.share, color: Colors.white,),
      SizedBox(width: 10,),
    ],
    centerTitle: true,
  );

  Widget buildImagePoster(double shrinkOffset, double top, double left, double posterWidth, double posterHeight, String title, String year) => Positioned(
    top: top,
    left: left,
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.cyan,
                border: Border.all(
                    color: Colors.amber,
                    width: 4
                )
            ),
            width: posterWidth,
            height: posterHeight,
            child: MovieImage(url: posterUrl),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text("$title ($year)", style: Constants.titleFontStyle,),
          ),
        ],
      ),
    ),
  );

}
