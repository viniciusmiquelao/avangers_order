import 'package:avangers_order/src/domain/entities/marvel_film_entity.dart';

class MarvelFilmModel extends MarvelFilmEntity {
  const MarvelFilmModel({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] =
        posterPath.replaceAll('https://image.tmdb.org/t/p/w500', '');
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }

  factory MarvelFilmModel.fromMap(Map<String, dynamic> map) {
    return MarvelFilmModel(
      adult: map['adult'],
      backdropPath: map['backdrop_path'],
      genreIds: map['genre_ids'],
      id: map['id'],
      originalLanguage: map['original_language'],
      originalTitle: map['original_title'],
      overview: map['overview'],
      popularity: map['popularity'],
      posterPath: 'https://image.tmdb.org/t/p/w500${map['poster_path']}',
      releaseDate: map['release_date'],
      title: map['title'],
      video: map['video'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
    );
  }
}
