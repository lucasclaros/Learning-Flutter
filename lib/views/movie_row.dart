import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:teste/constants.dart';
import 'package:teste/controller/movie_api.dart';

class MovieRow extends StatelessWidget {
  final List movieList;
  final int index;
  const MovieRow({Key? key, required this.movieList, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: Border.all(
            color: Constants.borderRowColor,
            width: 6.0,
          )
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => GetSelectedMovie(movieId: movieList[index].id)),
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
                    padding: const EdgeInsets.all(4),
                    child: SizedBox(
                        width: 80,
                        height: 160,
                        child: MovieImage(url: movieList[index].posterUrl, id: movieList[index].id.toString(),)
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:6.5, left: 5.0),
                        child: Container(child: Text(movieList[index].title + " ("+movieList[index].releaseDate.year.toString()+")",
                            style: Constants.titleFontStyle)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:6.5, left: 3.0),
                        child: Row(
                          children: [
                            RatingBar.builder(
                              initialRating: movieList[index].voteAverage / 2.0,
                              ignoreGestures: true,
                              itemSize: 17,
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star_sharp,
                                color: Constants.starListColor,
                              ),
                              onRatingUpdate: (rating) {
                              },
                            ),
                            Text(movieList[index].voteAverage.toString(), style: const TextStyle(fontSize: 14.0, color: Colors.white)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.5, left: 9.0),
                        child: Row(
                          children: [
                            const Text("Genres: ", style: TextStyle(fontSize: 14.0, color: Colors.white)),
                            Expanded(child: Text(movieList[index].genres.toSet().toList().join(', '),
                                style: Constants.genreFontStyle),)
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
