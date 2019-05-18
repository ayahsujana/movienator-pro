import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_movienator_pro/bloc/latest_movie_bloc.dart';
import 'package:the_movienator_pro/view/list/latest_movie.dart';
import 'package:the_movienator_pro/widget/gradient.dart';

Widget featureMovieView(BuildContext context, PageController _controller) {
  return new Container(
    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
    height: 320.0,
    width: MediaQuery.of(context).size.width - 40,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: new Text("Feature Movies",
                  style: TextStyle(
                      color: Color(0xFF90203F),
                      fontFamily: 'google',
                      fontSize: 26.0,
                      fontWeight: FontWeight.w700)),
            ),
            new IconButton(
              icon: Icon(
                FontAwesomeIcons.chevronCircleLeft,
              ),
              onPressed: () => _controller.previousPage(
                  curve: Curves.easeIn, duration: Duration(milliseconds: 1200)),
            ),
            new IconButton(
              icon: Icon(
                FontAwesomeIcons.chevronCircleRight,
              ),
              onPressed: () => _controller.nextPage(
                  curve: Curves.easeOut,
                  duration: Duration(milliseconds: 1200)),
            )
          ],
        ),
        new Container(
          margin: const EdgeInsets.only(top: 3.0, bottom: 14.0),
          width: (MediaQuery.of(context).size.width - 40) / 1.0,
          height: 3.0,
          decoration: BoxDecoration(
              gradient: pinkRedGradient,
              borderRadius: BorderRadius.circular(14.0)),
        ),
        new Expanded(
            child: new StreamBuilder(
          stream: movieListBloc.latestMovies,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return new Center(
                  child: Text("Connection Not Found"),
                );
              case ConnectionState.waiting:
                return Center(
                    child: SpinKitThreeBounce(
                  size: 24.0,
                  itemBuilder: (_, index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: blackBlueGradient, shape: BoxShape.circle),
                    );
                  },
                ));

              default:
                if (snapshot.hasError) {
                  return new Center(
                    child: Text("Error : ${snapshot.error}"),
                  );
                }
                var _latestMovies = snapshot.data;
                return new PageView.builder(
                  controller: _controller,
                  physics: BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return FeatureMovies(_latestMovies[index]);
                  },
                );
            }
          },
        ))
      ],
    ),
  );
}
