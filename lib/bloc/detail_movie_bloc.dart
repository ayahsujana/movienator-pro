import 'package:rxdart/rxdart.dart';
import 'package:the_movienator_pro/bloc/repository.dart';
import 'package:the_movienator_pro/model/movieModel.dart';

class MovieDetailBloc {
  final repository = Repository();
  final detailFetcher = PublishSubject<List<Movies>>();

  Observable<List<Movies>> get detailMovie => detailFetcher.stream;

  getDetailMovie(int id) async {
    List<Movies> movieList = await repository.getDetailMovie(id);
    try {
      if (movieList.isNotEmpty) {
        return detailFetcher.sink.add(movieList);
      } else {
        return detailFetcher.sink.add(null);
      }
    } catch (e) {
    }
    print('object : $movieList');
  }

  dispose() {
    detailFetcher.close();
  }
}

final movieDetailBloc = MovieDetailBloc();