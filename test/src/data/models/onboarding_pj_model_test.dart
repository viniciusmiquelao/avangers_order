import 'package:avangers_order/src/data/models/marvel_film_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const mock = {
    "adult": false,
    "backdrop_path": "/yFuKvT4Vm3sKHdFY4eG6I4ldAnn.jpg",
    "genre_ids": [28, 12, 878],
    "id": 1771,
    "original_language": "en",
    "original_title": "Captain America: The First Avenger",
    "overview":
        "Steve Rogers é um jovem que participa de experiências visando a criação do supersoldado americano. Quando os oficiais militares conseguem transformá-lo em uma arma humana, eles percebem que não podem arriscar a vida do jovem nas batalhas de guerra.",
    "popularity": 44.224,
    "poster_path": "/xYijVAPunk6neVW2KHKE4Lp45ZU.jpg",
    "release_date": "2011-07-22",
    "title": "Capitão América: O Primeiro Vingador",
    "video": false,
    "vote_average": 7.0,
    "vote_count": 16878
  };
  late MarvelFilmModel model;
  group("[DATA] -  MarvelFilmModel", () {
    setUp(() => model = MarvelFilmModel.fromMap(mock));
    test("fromMap", () {
      expect(model.adult, mock['adult']);
      expect(model.backdropPath, mock['backdrop_path']);
      expect(model.genreIds, mock['genre_ids']);
      expect(model.id, mock['id']);
      expect(model.originalLanguage, mock['original_language']);
      expect(model.originalTitle, mock['original_title']);
      expect(model.overview, mock['overview']);
      expect(model.popularity, mock['popularity']);
      expect(model.posterPath, mock['poster_path']);
      expect(model.releaseDate, mock['release_date']);
      expect(model.title, mock['title']);
      expect(model.video, mock['video']);
      expect(model.voteAverage, mock['vote_average']);
      expect(model.voteCount, mock['vote_count']);
    });

    test("ToMap", () {
      expect(model.toMap(), mock);
    });
  });
}
