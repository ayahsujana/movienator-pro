import 'package:flutter/material.dart';
import 'package:the_movienator_pro/widget/genre_item_movie.dart';
import 'package:the_movienator_pro/widget/gradient.dart';

Widget genreSectionViewFirst(Animation<double> animation) {
  return Container(
    margin: EdgeInsets.only(left: 8.0, right: 8.0),
    child: FittedBox(
      child: new Row(
        children: <Widget>[
          GenreSection(
            gradient: redSexyGradient,
            image: 'action',
            title: 'ACTION',
            color: const Color(0xFFF6356F).withOpacity(0.8),
            animation: animation,
            genreID: 28,
          ),
          SizedBox(
            width: 28.0,
          ),
          GenreSection(
            gradient: violetSexyGradient,
            image: 'comedy',
            title: 'COMEDY',
            color: const Color(0xFF52A7EA).withOpacity(0.8),
            animation: animation,
            genreID: 35,
          )
        ],
      ),
    ),
  );
}

Widget genreSectionViewSecond(Animation<double> animation) {
  return Container(
    margin: EdgeInsets.only(left: 8.0, right: 8.0),
    child: FittedBox(
      child: new Row(
        children: <Widget>[
          GenreSection(
            gradient: greenSexyGradient,
            image: 'horror',
            title: 'HORROR',
            color: const Color(0xFF92D000).withOpacity(0.8),
            animation: animation,
            genreID: 27,
          ),
          SizedBox(
            width: 28.0,
          ),
          GenreSection(
            gradient: orangeSexyGradient,
            image: 'romance',
            title: 'ROMANCE',
            color: const Color(0xFFFF9B30).withOpacity(0.8),
            animation: animation,
            genreID: 10749,
          )
        ],
      ),
    ),
  );
}
