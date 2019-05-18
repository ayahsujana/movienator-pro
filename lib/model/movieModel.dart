import 'dart:convert';

List<Movies> moviesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Movies>.from(jsonData.map((x) => Movies.fromJson(x)));
}

String moviesToJson(List<Movies> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Movies {
  String movId;
  String id;
  String imdbId;
  String voteAverage;
  String title;
  String posterPath;
  String genres;
  String backdropPath;
  String overview;
  String releaseDate;
  String streamUrl;
  String status;
  String type;

  Movies(
    this.movId,
    this.id,
    this.imdbId,
    this.voteAverage,
    this.title,
    this.posterPath,
    this.genres,
    this.backdropPath,
    this.overview,
    this.releaseDate,
    this.streamUrl,
    this.status,
    this.type,
  );

  factory Movies.fromJson(Map<String, dynamic> json) => new Movies(
        json["mov_id"],
        json["id"],
        json["imdb_id"],
        json["vote_average"],
        json["title"],
        json["poster_path"],
        json["genres"],
        json["backdrop_path"],
        json["overview"],
        json["release_date"],
        json["stream_url"],
        json["status"],
        json["type"],
      );

  Map<String, dynamic> toJson() => {
        "mov_id": movId,
        "id": id,
        "imdb_id": imdbId,
        "vote_average": voteAverage,
        "title": title,
        "poster_path": posterPath,
        "genres": genres,
        "backdrop_path": backdropPath,
        "overview": overview,
        "release_date": releaseDate,
        "stream_url": streamUrl,
        "status": status,
        "type": type,
      };
}
