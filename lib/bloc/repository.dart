import 'dart:async';

import 'package:the_movienator_pro/bloc/api_provider.dart';
import 'package:the_movienator_pro/model/movieModel.dart';


class Repository {
  final apiProvider = ApiProvider();

  Future<List<Movies>> getDetailMovie(int id) => apiProvider.getDetail(id);
  Future<List<Movies>> getLatestMovies() => apiProvider.getLatestMovies();
}