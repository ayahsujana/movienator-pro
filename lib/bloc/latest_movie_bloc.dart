import 'package:rxdart/rxdart.dart';
import 'package:the_movienator_pro/bloc/repository.dart';
import 'package:the_movienator_pro/model/movieModel.dart';

class MovieListBloc{
  final repository = Repository();
  final latestFetcher = PublishSubject<List<Movies>>();

  Observable<List<Movies>> get latestMovies => latestFetcher.stream;

  getLatestList() async {
    List<Movies> movieList = await repository.getLatestMovies();
    latestFetcher.sink.add(movieList);
  }
  
  dispose() {
    latestFetcher.close();
  }
}

final movieListBloc = MovieListBloc();