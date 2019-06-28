import 'package:flutter/material.dart';
import 'package:movie_ui/models.dart';
import 'package:movie_ui/arc_banner_image.dart';
import 'package:movie_ui/rating_information.dart';
import 'package:movie_ui/poster.dart';

class MovieDetailHeader extends StatelessWidget {
  final Movie movie;

  MovieDetailHeader(this.movie);

  List<Widget> _buildCategoryChips(TextTheme textTheme) {
    return movie.categories.map((cat) {
      return Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(cat),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black12,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          movie.title,
          style: textTheme.title,
        ),
        SizedBox(height: 8.0),
        RatingInformation(movie),
        SizedBox(height: 12.0),
        Row(children: _buildCategoryChips(textTheme)),
      ],
    );

    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 140.0),
          child: ArcBannerImage(movie.bannerUrl),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Poster(
                posterUrl: movie.posterUrl,
                height: 180.0,
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: movieInformation,
              )
            ],
          ),
        ),
      ],
    );
  }
}
