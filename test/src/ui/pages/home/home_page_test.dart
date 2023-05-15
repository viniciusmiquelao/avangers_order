import 'package:avangers_order/src/data/models/marvel_film_model.dart';
import 'package:avangers_order/src/ui/blocs/states/base_page_state.dart';
import 'package:avangers_order/src/ui/pages/home/components/home_banner.dart';
import 'package:avangers_order/src/ui/pages/home/components/home_error_widget.dart';
import 'package:avangers_order/src/ui/pages/home/components/skeleton_home_banner.dart';
import 'package:avangers_order/src/ui/pages/home/home_bloc.dart';
import 'package:avangers_order/src/ui/pages/home/home_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../shared/test_helper.dart';

class HomeBlocMock extends Mock implements HomeBloc {}

class ModuleMock extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<HomeBloc>(HomeBlocMock()),
      ];
}

void main() {
  late HomeBloc homeBloc;

  setUpAll(() {
    homeBloc = HomeBlocMock();

    initModule(
      ModuleMock(),
      replaceBinds: [
        Bind.instance<HomeBloc>(homeBloc),
      ],
    );
  });
  group('[UI] - HomePage', () {
    testWidgets(
      'EmptyState',
      (tester) async {
        when(() => homeBloc()).thenAnswer((_) async => () {});
        whenListen(
          homeBloc,
          Stream<BaseState>.fromIterable([
            const EmptyState(),
          ]),
          initialState: const EmptyState(),
        );

        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(
            TestSharedHelper.buildTestableWithScaffoldWidget(
              widget: const HomePage(),
            ),
          );
          await tester.pump();
        });

        await tester.pump();

        expect(find.byKey(const Key('EmptyStateKey')), findsNWidgets(7));
      },
    );

    testWidgets(
      'LoadingState',
      (tester) async {
        when(() => homeBloc()).thenAnswer((_) async => () {});
        whenListen(
          homeBloc,
          Stream<BaseState>.fromIterable([
            const LoadingState(),
          ]),
          initialState: const LoadingState(),
        );

        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(
            TestSharedHelper.buildTestableWithScaffoldWidget(
              widget: const HomePage(),
            ),
          );
          await tester.pump();
        });

        await tester.pump();

        expect(find.byType(SkeletonHomeBanner), findsNWidgets(6));
      },
    );

    testWidgets(
      'ErrorState',
      (tester) async {
        when(() => homeBloc()).thenAnswer((_) async => () {});
        whenListen(
          homeBloc,
          Stream<BaseState>.fromIterable([
            const ErrorState(''),
          ]),
          initialState: const ErrorState(''),
        );

        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(
            TestSharedHelper.buildTestableWithScaffoldWidget(
              widget: const HomePage(),
            ),
          );
          await tester.pump();
        });

        await tester.pump();

        expect(find.byType(HomeErrorWidget), findsOneWidget);
      },
    );

    testWidgets(
      'SuccessState',
      (tester) async {
        const list = [
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
            releaseDate: '2014',
            title: 'Teste',
            video: false,
            voteAverage: 0.0,
            voteCount: 1,
          )
        ];
        when(() => homeBloc()).thenAnswer((_) async => list);
        whenListen(
          homeBloc,
          Stream<BaseState>.fromIterable([
            const SuccessState(list),
          ]),
          initialState: const SuccessState(list),
        );

        await mockNetworkImagesFor(() async {
          await tester.pumpWidget(
            TestSharedHelper.buildTestableWithScaffoldWidget(
              widget: const HomePage(),
            ),
          );
          await tester.pump();
        });

        await tester.pump();

        expect(find.byType(HomeBannerComponent), findsOneWidget);
      },
    );
  });
}
