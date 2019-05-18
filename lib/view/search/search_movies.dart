import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_movienator_pro/util/domain.dart';
import 'package:the_movienator_pro/view/search/search_result.dart';
import 'package:the_movienator_pro/widget/gradient.dart';

class MovieSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var searchResults;
    return new FutureBuilder(
      future: fetchMovies(1, query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SpinKitThreeBounce(
              size: 25.0,
              itemBuilder: (context, index) {
                return DecoratedBox(
                  decoration: BoxDecoration(gradient: blackBlueGradient),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Some error occured"),
          );
        }
        searchResults = snapshot.data['results'];
        return Container(child: OrientationBuilder(
          builder: (context, orientation) {
            return GridView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(top: 5.0, right: 5.0, bottom: 15.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.landscape ? 5 : 3,
                  childAspectRatio: 0.50),
              itemCount: query.isEmpty || searchResults == null
                  ? 0
                  : searchResults.length,
              itemBuilder: (context, index) {
                var mediaType = searchResults[index]['media_type'];
                var _profilePath;
                var title;
                if (mediaType == 'tv') {
                  _profilePath = searchResults[index]['poster_path'];
                  title = searchResults[index]['name'];
                } else if (mediaType == 'movie') {
                  _profilePath = searchResults[index]['poster_path'];
                  title = searchResults[index]['title'];
                } else {
                  _profilePath = searchResults[index]['profile_path'];
                  title = searchResults[index]['name'];
                }

                var id = searchResults[index]['id'];

                return SearchResults(
                  posterImage: _profilePath,
                  title: title,
                  type: mediaType,
                  id: id,
                );
              },
            );
          },
        ));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Icon(
        FontAwesomeIcons.searchDollar,
        size: 54.0,
      ),
    );
  }
}
