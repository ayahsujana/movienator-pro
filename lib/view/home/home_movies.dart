import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import 'package:the_movienator_pro/bloc/latest_movie_bloc.dart';
import 'package:the_movienator_pro/util/admob.dart';
import 'package:the_movienator_pro/util/domain.dart';
import 'package:the_movienator_pro/util/setting.dart';
import 'package:the_movienator_pro/widget/feature_movie_view.dart';
import 'package:the_movienator_pro/widget/gradient.dart';
import 'package:the_movienator_pro/widget/in_theaters_movie_view.dart';
import 'package:the_movienator_pro/widget/search_movie_view.dart';
import 'package:the_movienator_pro/widget/top_rate_movie_view.dart';
import 'package:the_movienator_pro/widget/trending_movie_view.dart';
import 'package:the_movienator_pro/widget/upcoming_movie_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _animationController;
  var movies;
  var upcoming;
  var now;
  Future<Map> _getTopMovies;
  Future<Map> _getPopular;
  Future<Map> _getUpcoming;
  Future<Map> _getNow;
  PageController _controller = PageController();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 180.0, end: -7.0).animate(CurvedAnimation(
        curve: Curves.bounceInOut, parent: _animationController));
    _animationController.forward();
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.dispose();
      }
    });
    _getNow = getNowPlaying();
    _getPopular = getPopularMovies();
    _getUpcoming = getUpcomingMovies();
    _getTopMovies = getTopRatedMovies();
    movieListBloc.getLatestList();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent.withOpacity(0.7)));

    return WillPopScope(
      onWillPop: _onBackPress,
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Color(0xFFF6F7FB),
          body: new ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    height: 350.0,
                    child: new Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        new Positioned(
                          top: -65.0,
                          left: -85.0,
                          child: new Container(
                            height: 320.0,
                            width: 340.0,
                            decoration: BoxDecoration(
                                gradient: violetSexyGradient,
                                shape: BoxShape.circle),
                          ),
                        ),
                        new Positioned(
                          right: 12.0,
                          top: 6.0,
                          child: new Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                gradient: redSexyGradient,
                                shape: BoxShape.circle),
                          ),
                        ),
                        searchMovieView(context, animation),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  topRateMovieView(context, _getTopMovies),
                  Container(
                    height: 250.0,
                    alignment: Alignment.center,
                    child: AdmobBanner(
                      adUnitId: banner,
                      adSize: AdmobBannerSize.MEDIUM_RECTANGLE,
                    ),
                  ),
                  new SizedBox(
                    height: 16.0,
                  ),
                  featureMovieView(context, _controller),
                  new SizedBox(
                    height: 24.0,
                  ),
                  trendingMovieView(context, _getPopular),
                  upComingMovieView(context, _getUpcoming),
                  inTheatersMovieView(context, _getNow),
                  Container(
                    alignment: Alignment.center,
                    child: AdmobBanner(
                      adUnitId: banner,
                      adSize: AdmobBannerSize.BANNER,
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }

  Future<bool> _onBackPress() {
    return showCupertinoModalPopup(
        context: context,
        builder: (context) => new CupertinoActionSheet(
              title: Text("Do you wish to close the app ?"),
              cancelButton: CupertinoActionSheetAction(
                child: const Text("Close"),
                isDefaultAction: true,
                onPressed: () => Navigator.of(context).pop(true),
              ),
              message: Text("Have you reviewed the app on Playstore yet ?"),
              actions: <Widget>[
                CupertinoActionSheetAction(
                    child: Text("Review now on Playstore"),
                    onPressed: () {
                      Navigator.pop(context);
                      LaunchReview.launch(
                          androidAppId: 'com.moviflix.moviehdthriller');
                    }),
                CupertinoActionSheetAction(
                    child: Text("Share the App"),
                    onPressed: () => Share.share(
                        "Hey! Check out this app on Playstore. MoviFlix Pro is a Movie Database app. If you love the app please review the app on playstore and share it with your friends. https://play.google.com/store/apps/details?id=com.moviflix.moviehdthriller")),
                CupertinoActionSheetAction(
                  child: Text("Read Me"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(CupertinoPageRoute(
                        maintainState: true,
                        builder: (context) => new Settings()));
                  },
                ),
              ],
            ));
  }
}
