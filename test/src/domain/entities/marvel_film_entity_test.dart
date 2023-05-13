import 'package:avangers_order/src/domain/entities/marvel_film_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[DOMAIN] - MarvelFilmEntity', () {
    late MarvelFilmEntity marvelFilmEntity;
    setUpAll(() {
      marvelFilmEntity = const MarvelFilmEntity(
        adult: false,
        backdropPath: 'backdropPath',
        genreIds: [1, 2, 3],
        id: 1,
        originalLanguage: 'originalLanguage',
        originalTitle: 'originalTitle',
        overview: 'overview',
        popularity: 0.0,
        posterPath: 'posterPath',
        releaseDate: 'releaseDate',
        title: 'title',
        video: false,
        voteAverage: 0.0,
        voteCount: 1,
      );
    });
    test('Test attributes is not Null (MarvelFilmEntity)', () async {
      expect(marvelFilmEntity.adult, isNot(null));
      expect(marvelFilmEntity.backdropPath, isNot(null));
      expect(marvelFilmEntity.genreIds, isNot(null));
      expect(marvelFilmEntity.id, isNot(null));
      expect(marvelFilmEntity.originalLanguage, isNot(null));
      expect(marvelFilmEntity.originalTitle, isNot(null));
      expect(marvelFilmEntity.overview, isNot(null));
      expect(marvelFilmEntity.popularity, isNot(null));
      expect(marvelFilmEntity.posterPath, isNot(null));
      expect(marvelFilmEntity.releaseDate, isNot(null));
      expect(marvelFilmEntity.title, isNot(null));
      expect(marvelFilmEntity.video, isNot(null));
      expect(marvelFilmEntity.voteAverage, isNot(null));
      expect(marvelFilmEntity.voteCount, isNot(null));
    });
    test('Test attributes (MarvelFilmEntity)', () async {
      expect(marvelFilmEntity.adult, false);
      expect(marvelFilmEntity.backdropPath, 'backdropPath');
      expect(marvelFilmEntity.genreIds, [1, 2, 3]);
      expect(marvelFilmEntity.id, 1);
      expect(marvelFilmEntity.originalLanguage, 'originalLanguage');
      expect(marvelFilmEntity.originalTitle, 'originalTitle');
      expect(marvelFilmEntity.overview, 'overview');
      expect(marvelFilmEntity.popularity, 0.0);
      expect(marvelFilmEntity.posterPath, 'posterPath');
      expect(marvelFilmEntity.releaseDate, 'releaseDate');
      expect(marvelFilmEntity.title, 'title');
      expect(marvelFilmEntity.video, false);
      expect(marvelFilmEntity.voteAverage, 0.0);
      expect(marvelFilmEntity.voteCount, 1);
    });

    test('Test props)', () async {
      expect(marvelFilmEntity.props[0], marvelFilmEntity.adult);
      expect(marvelFilmEntity.props[1], marvelFilmEntity.backdropPath);
      expect(marvelFilmEntity.props[2], marvelFilmEntity.genreIds);
      expect(marvelFilmEntity.props[3], marvelFilmEntity.id);
      expect(marvelFilmEntity.props[4], marvelFilmEntity.originalLanguage);
      expect(marvelFilmEntity.props[5], marvelFilmEntity.originalTitle);
      expect(marvelFilmEntity.props[6], marvelFilmEntity.overview);
      expect(marvelFilmEntity.props[7], marvelFilmEntity.popularity);
      expect(marvelFilmEntity.props[8], marvelFilmEntity.posterPath);
      expect(marvelFilmEntity.props[9], marvelFilmEntity.releaseDate);
      expect(marvelFilmEntity.props[10], marvelFilmEntity.title);
      expect(marvelFilmEntity.props[11], marvelFilmEntity.video);
      expect(marvelFilmEntity.props[12], marvelFilmEntity.voteAverage);
      expect(marvelFilmEntity.props[13], marvelFilmEntity.voteCount);
    });
  });
}
