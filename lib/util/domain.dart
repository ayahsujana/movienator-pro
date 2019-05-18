import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map> getPopularMovies() async {
  var url =
      'https://api.themoviedb.org/3/movie/popular?api_key=1a43f1f22e3cf15ce2cfd8ca5af13e6f';
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return Future.error("Failed to establish connection");
  }
}

Future<Map> getUpcomingMovies() async {
  var url =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=1a43f1f22e3cf15ce2cfd8ca5af13e6f';
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return Future.error("Failed to establish connection");
  }
}

Future<Map> getNowPlaying() async {
  var url =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=1a43f1f22e3cf15ce2cfd8ca5af13e6f';
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return Future.error("Failed to establish connection");
  }
}

Future<Map> getNowPlayingMovies() async {
  var url =
      'https://api.themoviedb.org/3/trending/all/day?api_key=1a43f1f22e3cf15ce2cfd8ca5af13e6f';
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return Future.error("Failed to establish connection");
  }
}

Future<Map> getJson() async {
  var url =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=1a43f1f22e3cf15ce2cfd8ca5af13e6f";
  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return Future.error("Failed to establish connection");
  }
}

Future<Map> getTopRatedMovies() async {
  var url =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=1a43f1f22e3cf15ce2cfd8ca5af13e6f";
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return Future.error("Failed to establish connection");
  }
}

Future<Map> fetchMovies(int pageNumber, String query) async {
  http.Response response = await http.get(
      'https://api.themoviedb.org/3/search/multi?api_key=1a43f1f22e3cf15ce2cfd8ca5af13e6f&language=en-US&query=$query&page=$pageNumber');
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return Future.error("Failed to establish connection");
  }
}

Future<Map> getMovieDetail(var id) async {
  var url =
      "https://api.themoviedb.org/3/movie/$id?api_key=1a43f1f22e3cf15ce2cfd8ca5af13e6f&append_to_response=credits,similar,videos";
  http.Response response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return Future.error("Failed to establish connection");
  }
}

Future<Map> getCastDetails(var id) async {
  var url =
      'https://api.themoviedb.org/3/person/$id?api_key=1a43f1f22e3cf15ce2cfd8ca5af13e6f&append_to_response=images,combined_credits';
  http.Response response = await http.get(url);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    return Future.error("Failed to establish connection");
  }
}

Future<Map> getGenreMovies(var id) async {
  var url =
      'https://api.themoviedb.org/3/discover/movie?api_key=1a43f1f22e3cf15ce2cfd8ca5af13e6f&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=$id';
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
