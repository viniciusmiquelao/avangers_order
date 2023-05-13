import 'package:avangers_order/src/data/models/marvel_film_model.dart';
import 'package:avangers_order/src/domain/repositories/repositories.dart';
import 'package:avangers_order/src/domain/usecases/usecases.dart';
import 'package:avangers_order/src/shared/errors/base_error.dart';
import 'package:avangers_order/src/shared/result_wrapper/result_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class RepositoryMock extends Mock implements IMarvelFilmsRepository {}

void main() {
  late IMarvelFilmsRepository repository;
  late IMarvelFilmsUsecase usecase;

  setUp(() {
    repository = RepositoryMock();
    usecase = MarvelFilmsUsecase(repository);
  });
  group('[Domain] - MarvelFilmsUsecase', () {
    test('When repository return success ', () async {
      when(() => repository()).thenAnswer(
        (_) async => ResultSuccess<List<MarvelFilmModel>>(
          const [
            MarvelFilmModel(
              adult: false,
              backdropPath: '',
              genreIds: [],
              id: 1,
              originalLanguage: '',
              originalTitle: '',
              overview: '',
              popularity: 0.0,
              posterPath: '',
              releaseDate: '',
              title: '',
              video: false,
              voteAverage: 0.0,
              voteCount: 1,
            )
          ],
        ),
      );

      final result = await usecase();
      expect(result.getSuccessData, isA<List<MarvelFilmModel>>());
    });

    test('When repository return error ', () async {
      when(() => repository())
          .thenAnswer((_) async => ResultError(BaseError('error')));

      final result = await usecase();
      expect(result.isError, true);
      expect(result.getErrorData.message, 'error');
    });
  });
}
