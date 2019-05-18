import 'package:flutter/material.dart';
import 'package:the_movienator_pro/widget/genre_view_movie.dart';

class GenreSection extends AnimatedWidget {
  final image;
  final title;
  final gradient;
  final color;
  final genreID;

  GenreSection(
      {Key key,
      this.genreID,
      Animation<double> animation,
      this.image,
      this.title,
      this.gradient,
      this.color})
      : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => GenreMovies(
                genreId: genreID,
                genretype: 'movie',
                title: title,
                image: image,
              ),
        ));
      },
      child: Container(
        height: 120.0,
        width: 187.0,
        child: Stack(
          children: <Widget>[
            new Container(
              height: 108.0,
              width: 167.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  gradient: gradient,
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                        color: color,
                        blurRadius: 5.0,
                        spreadRadius: 0.4,
                        offset: Offset(0.7, 3.0)),
                  ]),
            ),
            new Positioned(
              top: 45.0,
              left: 25.0,
              child: Hero(
                tag: genreID.toString(),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'google',
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            new Positioned(
              bottom: 0.0,
              right: animation.value,
              top: 0.0,
              child: Hero(
                  tag: title,
                  child: Image.asset(
                    "assets/images/$image.png",
                  )),
            )
          ],
        ),
      ),
    );
  }
}
