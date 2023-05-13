import 'package:avangers_order/src/data/datasources/datasources.dart';
import 'package:avangers_order/src/data/repositories/marvel_films_repository_impl.dart';
import 'package:avangers_order/src/domain/repositories/repositories.dart';
import 'package:avangers_order/src/shared/errors/base_error.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DatasourceMock extends Mock implements IMarvelFilmsDatasource {}

void main() {
  late IMarvelFilmsDatasource datasource;
  late IMarvelFilmsRepository repository;
  setUpAll(() {
    datasource = DatasourceMock();
    repository = MarvelFilmsRepositoryImpl(datasource);
  });
  group('[DATA] - MarvelFilmRepository', () {
    test('When return exception', () async {
      when(() => datasource()).thenThrow(Exception('error'));

      var result = await repository();
      expect(result.isError, true);
      expect(result.getErrorData.message, 'Exception: error');
    });
    test('When return BaseError', () async {
      when(() => datasource()).thenThrow(BaseError('error'));

      var result = await repository();
      expect(result.isError, true);
      expect(result.getErrorData.message, 'error');
    });
    test('When return success', () async {
      when(() => datasource()).thenAnswer((_) async => []);

      var result = await repository();
      expect(result.isSuccess, true);
      expect(result.getSuccessData, []);
    });
  });
}
