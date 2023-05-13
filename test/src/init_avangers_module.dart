import 'package:avangers_order/src/avengers_module.dart';
import 'package:avangers_order/src/data/datasources/datasources.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mocktail/mocktail.dart';

import 'package:modular_test/modular_test.dart';

//DatasourcesMock
class MarvelFilmsDatasourceMock extends Mock
    implements IMarvelFilmsDatasource {}

class AvengersDependencies {
  static void init(List binds) {
    initModule(AvengersModule(), replaceBinds: [
      Bind.instance<IMarvelFilmsDatasource>(MarvelFilmsDatasourceMock()),
      ...binds
    ]);
  }
}
