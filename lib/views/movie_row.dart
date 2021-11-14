import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teste/constants.dart';
import 'package:teste/controller/movie_api.dart';
import 'package:teste/views/movie_view.dart';

class MovieRow extends StatelessWidget {
  final List movieList;
  final int index;
  const MovieRow({Key? key, required this.movieList, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Image movieImage;
    return Container(
      decoration: ShapeDecoration(
        shape: Border.all(
          color: Constants.rowColor,
          width: 6.0,
        )
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const MovieView()),
          );
        },
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child:
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: SizedBox(
                        width: 80,
                        height: 160,
                        child: MovieImage(url: movieList[index].posterUrl)
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top:6.5, left: 5.0),
                        child: Text(movieList[index].title + " ("+movieList[index].date.year.toString()+")",
                          style: Constants.titleFontStyle),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:6.5, left: 3.0),
                        child: Row(
                          children: [
                            RatingBar.builder(
                              initialRating: movieList[index].average / 2.0,
                              ignoreGestures: true,
                              itemSize: 17,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star_sharp,
                                color: Colors.orangeAccent.shade200,
                              ),
                              onRatingUpdate: (rating) {
                              },
                            ),
                            Text(movieList[index].average.toString(), style: TextStyle(fontSize: 14.0, color: Colors.white)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.5, left: 9.0),
                        child: Row(
                          children: [
                            Text("Genres: ",
                                style: TextStyle(fontSize: 14.0, color: Colors.white)),

                            Text(movieList[index].genres.toSet().toList().join(', '),
                                style: TextStyle(fontSize: 14.0, color: Colors.white, fontFamily: 'Rimouski', fontStyle: FontStyle.italic)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
