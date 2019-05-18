import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launch_review/launch_review.dart';
import 'package:the_movienator_pro/widget/gradient.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new SizedBox(
              height: 10.0,
            ),
            SafeArea(
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.arrowLeft),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                          fontFamily: 'google',
                          fontSize: 37.0,
                          color: Colors.blueGrey.shade800,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    _listTileSettings(1, 'Terms and Conditions','Terms and Conditions', _launchTerms),
                    _listTileSettings(2, 'Privacy Policy', 'Privacy Policy', _launchPrivacy),
                    _listTileSettings(3, 'DMCA', 'DMCA', _launchDMCA),
                    _listTileSettings(4, 'Feedback', 'Send feedback', _launchFeedback),
                    _listTileSettings(5, 'About', 'version 1.0', null),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _listTileSettings(
      int number, String title, String subtitle, Function _onPresss) {
    return Card(
      elevation: 5.0,
      child: ListTile(
        onTap: _onPresss,
        leading: CircleAvatar(
            child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: yellowOrangeGradient,
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            Center(
                child: Text(number.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'google',
                        fontSize: 20.0)))
          ],
        )),
        title: Text(title,
            style: TextStyle(
                color: Colors.black, fontFamily: 'google', fontSize: 20.0)),
        subtitle: Text(subtitle,
            style: TextStyle(
                color: Colors.black54, fontFamily: 'google', fontSize: 14.0)),
      ),
    );
  }

  _launchTerms() async {
    var url = "https://sites.google.com/view/termsconditions-s161t/home";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could Not launch url';
    }
  }

  _launchPrivacy() async {
    var url = "https://sites.google.com/view/privacy-s161t/home";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could Not launch url';
    }
  }

  _launchDMCA() async {
    var url = "https://sites.google.com/view/dmcanotice-s161t/home";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could Not launch url';
    }
  }

  _launchFeedback() {
    LaunchReview.launch(androidAppId: 'com.moviflix.moviehdthriller');
  }
}
