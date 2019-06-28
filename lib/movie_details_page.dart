import 'package:flutter/material.dart';
import 'package:movie_ui/models.dart';
import 'package:movie_ui/movie_detail_header.dart';
import 'package:movie_ui/story_line.dart';
import 'package:movie_ui/photo_scroller.dart';
import 'package:movie_ui/actor_scroller.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  MovieDetailsPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MovieDetailHeader(movie),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Storyline(movie.storyline),
            ),
            PhotoScroller(movie.photoUrls),
            SizedBox(
              height: 20.0,
            ),
            ActorScroller(movie.actors),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
