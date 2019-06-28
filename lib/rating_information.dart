import 'package:flutter/material.dart';
import 'package:movie_ui/models.dart';

class RatingInformation extends StatelessWidget {
  final Movie movie;
  RatingInformation(this.movie);

  Widget _buildRatingBar(ThemeData theme) {
    final stars = <Widget>[];

    for (var i = 0; i <= 5; i++) {
      final color = i <= movie.starRating ? theme.accentColor : Colors.black12;

      final star = Icon(Icons.star, color: color);

      stars.add(star);
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final ratingCaptionStyle =
        textTheme.caption.copyWith(color: Colors.black45);

    final numericRating = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          movie.rating.toString(),
          style: textTheme.title.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.accentColor,
          ),
        ),
        SizedBox(height: 4.0),
        Text("Ratings", style: ratingCaptionStyle),
      ],
    );

    final starRating = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildRatingBar(theme),
        Padding(
          padding: EdgeInsets.only(top: 4.0, left: 4.0),
          child: Text("Grade now", style: ratingCaptionStyle),
        )
      ],
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        numericRating,
        SizedBox(width: 16.0),
        starRating,
      ],
    );
  }
}
