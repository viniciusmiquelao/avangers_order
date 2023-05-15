import 'package:avangers_order/src/data/models/marvel_film_model.dart';
import 'package:avangers_order/src/domain/usecases/usecases.dart';
import 'package:avangers_order/src/shared/errors/base_error.dart';
import 'package:avangers_order/src/shared/result_wrapper/result_wrapper.dart';
import 'package:avangers_order/src/ui/blocs/states/base_page_state.dart';
import 'package:avangers_order/src/ui/pages/home/home_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mocktail/mocktail.dart';

class UsecaseMock extends Mock implements IMarvelFilmsUsecase {}

main() {
  late IMarvelFilmsUsecase usecase;
  late HomeBloc blocMock;

  group('[UI] - RegisterHomeBloc', () {
    setUp(() async {
      usecase = UsecaseMock();
      blocMock = HomeBloc(usecase);
      await setUpTestHive();
    });

    blocTest<HomeBloc, BaseState>(
      'Bloc Success',
      build: () => blocMock,
      act: (bloc) => bloc(),
      setUp: () {
        when(
          () => usecase(),
        ).thenAnswer(
          (_) async => ResultSuccess(
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
      },
      expect: () =>
          [isA<LoadingState>(), isA<SuccessState<List<MarvelFilmModel>>>()],
    );

    blocTest<HomeBloc, BaseState>(
      'Bloc Error',
      build: () => blocMock,
      act: (bloc) => bloc(),
      setUp: () {
        when(
          () => usecase(),
        ).thenAnswer(
          (e) async => ResultError(BaseError(e.toString())),
        );
      },
      expect: () => [isA<LoadingState>(), isA<ErrorState>()],
    );
  });
}
