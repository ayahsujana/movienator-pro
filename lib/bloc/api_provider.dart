import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:the_movienator_pro/model/movieModel.dart';

class ApiProvider {
  final apiKey = '678ef42a1b584848591cbd02ac3899c3';
  final token = 'a4d430d27a31c2a8b399b645ea58809c';
  final baseUrl = 'https://ayahsujana.com/asmovies/api';

  Future<List<Movies>> getDetail(int id) async {
    final response = await http.get('$baseUrl/detail/$id/$apiKey',
        headers: {HttpHeaders.authorizationHeader: '$token'});
    if (response.statusCode == 200) {
      print(response.request.url.toString());
      return compute(moviesFromJson, response.body);
    } else {
      throw Exception('Failed to get movie');
    }
  }

  Future<List<Movies>> getLatestMovies() async {
    final response = await http.get('$baseUrl/latest/$apiKey',
        headers: {HttpHeaders.authorizationHeader: '$token'});
    if (response.statusCode == 200) {
      print(response.request.url.toString());
      return compute(moviesFromJson, response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }
  
}