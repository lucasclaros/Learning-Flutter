import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:teste/controller/movie_api.dart';
import 'package:teste/models/movie_model.dart';

import '../constants.dart';

class SelectedMovieView extends StatefulWidget {
  final Movie movie;

  const SelectedMovieView({Key? key, required this.movie}) : super(key: key);

  @override
  _SelectedMovieViewState createState() => _SelectedMovieViewState();
}
class _SelectedMovieViewState extends State<SelectedMovieView>{
  var top = 0.0;
  late ScrollController _scrollController;

  @override
  void initState(){
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff222222),
        child: const Icon(Icons.star, color: Colors.amber,),onPressed: () {  },
      ),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                foregroundColor: Colors.amber,
                pinned: true,
                expandedHeight: 250,
                flexibleSpace: LayoutBuilder(
                    builder: (context, constraint){
                      top = constraint.biggest.height;
                      return FlexibleSpaceBar(
                        title: AnimatedOpacity(opacity: top <= 100 ? 1.0 : 0.0, duration: const Duration(milliseconds: 300),
                          child: Padding(padding: const EdgeInsets.only(right: 10),
                            child: Text(widget.movie.title, style: Constants.titleFontStyle),
                          ),
                        ),
                        centerTitle: true,
                        background: MovieImage(url: widget.movie.backdropUrl, id: widget.movie.id.toString(),
                        ),
                      );
                    }
                ),
                actions: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.share), color: Colors.white),
                  const SizedBox(width: 10,)
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _movieInfos()
                  ],
                ),
              ),
            ],
          ),
          _buildPost(),
        ],
      ),
    );
  }

  Widget _buildPost() {
    double scale = 0.75;
    double posterH = 300.0 * scale;
    double posterW = 200.0 * scale;
    double defaultMargin = 250-(posterH/2);

    if(_scrollController.hasClients){
      double offset = _scrollController.offset;
      defaultMargin -= offset;
    }

    return Positioned(
        top: defaultMargin,
        left: (MediaQuery.of(context).size.width-posterW)/2,
        child: AnimatedOpacity(
            opacity: top <= 120 ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 500),
            child: Container(
              decoration: BoxDecoration(
                  color: Constants.borderRowColor,
                  border: Border.all(
                    color: Colors.amber,
                    width: 3,
                  )
              ),
              height: posterH,
              width: posterW,
              child: MovieImage(url: widget.movie.posterUrl),
            )
        )
    );
  }

  Widget _movieInfos() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 3.0, color: Colors.amber),
        ),
      ),
      child: Column(
        children: [
          Container(height: 80,),
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 3.0),
                  child: Text(widget.movie.title+" (${widget.movie.releaseDate.year})", style: Constants.selectedMovieTitleStyle, textAlign: TextAlign.center,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  Text(widget.movie.voteAverage.toString() + " (${widget.movie.voteCount})", style: TextStyle(color: Colors.white),),
                  const Icon(Icons.person, color: Colors.white, size: 18),
                  SizedBox(width: 10,),
                  Text("${(widget.movie.runtime /60).toInt()}h${widget.movie.runtime -(widget.movie.runtime /60).toInt()*60}min", style: Constants.genreFontStyle,)
                ],
              )
            ],
          ),
          Container(height: 20,),
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text("Overview: ",
                  style: TextStyle(
                      decorationThickness: 3,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Colors.amber
                  )
              ),
            ),
            subtitle: Text(widget.movie.overview, style: Constants.selectedMovieFontStyle,),
          ),
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text("Release Date: ",
                  style: TextStyle(
                      decorationThickness: 3,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Colors.amber
                  )
              ),
            ),
            subtitle: Text("${widget.movie.releaseDate.day.toString()}/${widget.movie.releaseDate.month.toString()}/${widget.movie.releaseDate.year.toString()}"
              , style: Constants.selectedMovieFontStyle,),
          ),
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text("Genres: ",
                  style: TextStyle(
                      decorationThickness: 3,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Colors.amber
                  )
              ),
            ),
            subtitle: Text(widget.movie.genres.toSet().toList().join(', '),
              style: Constants.selectedMovieFontStyle,),
          ),
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text("Languages: ",
                  style: TextStyle(
                      decorationThickness: 3,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: Colors.amber
                  )
              ),
            ),
            subtitle: _getLanguages(widget.movie.spokenLanguages),
          ),
          _getTagline(widget.movie.tagline),
          Container(height: 100,),
        ],
      ),
    );
  }
  Widget _getLanguages(List<SpokenLanguage> languages)
  {
    List<Widget> list = <Widget>[];
    for(var i = 0; i < languages.length; i++){

      list.add(Text(languages[i].name+" (${languages[i].iso6391})", style: Constants.selectedMovieFontStyle,));

      if(i+1 < languages.length) {
        list.add(const Text(', ', style: Constants.selectedMovieFontStyle,));
      }
    }
    return Row(children: list);
  }

  Widget _getTagline(String? tagline) {
    if(tagline!.isEmpty) {
      return Container();
    } else{
      return ListTile(
          title: const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text("Tagline: ",
                      style: TextStyle(
                              decorationThickness: 3,
                              decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              color: Colors.amber
                      )
                  ),
            ),
          subtitle: Text("\"$tagline\"",
            style: Constants.selectedMovieFontStyle,),
      );
    }

  }
}






