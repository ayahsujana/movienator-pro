import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_movienator_pro/view/list/list_item_movie.dart';

import 'gradient.dart';

Widget upComingMovieView(BuildContext context, Future<Map> _getUpcoming) {
  return Container(
                    height: 275.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: new Text("Upcoming",
                              style: TextStyle(
                                  color: const Color(0xFFFF9B30),
                                  fontFamily: 'google',
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w700)),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(
                              top: 3.0, bottom: 14.0, left: 20.0),
                          width: (MediaQuery.of(context).size.width - 40) / 2.5,
                          height: 3.0,
                          decoration: BoxDecoration(
                              gradient: pinkRedGradient,
                              borderRadius: BorderRadius.circular(14.0)),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        new Expanded(
                          child: FutureBuilder(
                              future: _getUpcoming,
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
                                              gradient: blackBlueGradient,
                                              shape: BoxShape.circle),
                                        );
                                      },
                                    ));

                                  default:
                                    if (snapshot.hasError) {
                                      return new Center(
                                        child:
                                            Text("Error : ${snapshot.error}"),
                                      );
                                    }
                                    var upcoming = snapshot.data['results'];
                                    return ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: upcoming?.length ?? 0,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            padding: const EdgeInsets.only(
                                                right: 8.0, left: 16.0),
                                            child: new ListItemMovies(
                                                upcoming[index]));
                                      },
                                    );
                                }
                              }),
                        )
                      ],
                    ),
                  );
}