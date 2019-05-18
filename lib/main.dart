import 'package:flutter/material.dart';
import 'package:the_movienator_pro/util/admob.dart';
import 'package:the_movienator_pro/view/home/home_movies.dart';
import 'package:admob_flutter/admob_flutter.dart';

void main() { 
  Admob.initialize(appId);
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MoviFlexiPro',
      debugShowCheckedModeBanner: false,
      home: new HomeScreen(),
      theme: new ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black,
          bottomAppBarColor: Color(0xFFF6F7FB)),
    );
  }
}