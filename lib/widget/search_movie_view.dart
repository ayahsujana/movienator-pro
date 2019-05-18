import 'package:flutter/material.dart';
import 'package:the_movienator_pro/view/search/search_movies.dart';
import 'package:the_movienator_pro/widget/genre_section_view.dart';

Widget searchMovieView(BuildContext context, Animation<double> animation) {
  return new Positioned(
      top: 38.0,
      child: new Container(
          height: 300.0,
          width: MediaQuery.of(context).size.width,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  alignment: Alignment.center,
                  height: 60.0,
                  width: MediaQuery.of(context).size.width,
                  child: InkWell(
                    onTap: () =>
                        showSearch(context: context, delegate: MovieSearch()),
                    child: new Card(
                        elevation: 18.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.white,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Padding(
                                  padding: const EdgeInsets.only(left: 14.0)),
                              Expanded(
                                child: new Text(
                                  "Search for any Movie..",
                                  style: TextStyle(
                                      fontFamily: 'google',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ),
                              new Icon(Icons.search),
                              new Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                              )
                            ],
                          ),
                        )),
                  )),
              new SizedBox(
                height: 13.0,
              ),
              genreSectionViewFirst(animation),
              SizedBox(
                height: 18.0,
              ),
              genreSectionViewSecond(animation),
            ],
          )));
}
