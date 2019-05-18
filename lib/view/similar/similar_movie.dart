import 'package:flutter/material.dart';
import 'package:the_movienator_pro/view/detail/detail_movies.dart';
import 'package:transparent_image/transparent_image.dart';

class SimilarMovies extends StatelessWidget {
  final similarMovies;
  final type;
  final _imageURL = 'https://image.tmdb.org/t/p/w500';
  SimilarMovies(this.similarMovies, this.type);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (similarMovies['poster_path'] != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetail(similarMovies['id'])));
        } else {
          return null;
        }
      },
      child: new Container(
        alignment: Alignment.center,
        child: new Stack(
          fit: StackFit.loose,
          children: <Widget>[
            new Container(
              height: 320.0,
              width: 130.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        offset: Offset(1.0, 3.0)),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: FadeInImage.memoryNetwork(
                  image: similarMovies['poster_path'] != null
                      ? _imageURL + similarMovies['poster_path']
                      : 'https://image.freepik.com/free-vector/404-error-concept-with-camel-and-cactus_23-2147736339.jpg',
                  placeholder: kTransparentImage,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
