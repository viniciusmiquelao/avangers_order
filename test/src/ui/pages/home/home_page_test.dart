import 'package:avangers_order/src/ui/blocs/states/base_page_state.dart';
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
      'Deve conter todos os widgets',
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

        expect(find.byType(Scaffold), findsOneWidget);
      },
    );
  });
}
