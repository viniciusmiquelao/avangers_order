import 'package:avangers_order/src/data/datasources/datasources.dart';
import 'package:avangers_order/src/data/models/marvel_film_model.dart';
import 'package:avangers_order/src/data/services/app_http_client/app_http_client_service.dart';
import 'package:avangers_order/src/shared/errors/base_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../domain/mocks/films_mock.dart';

class DioMock extends Mock implements IAppHttpClientService {}

void main() {
  late DioMock dio;
  late IMarvelFilmsDatasource datasource;

  setUp(() async {
    dio = DioMock();
    datasource = MarvelFilmsDatasourceImpl(dio);
  });
  group('[DATA] - MarvelFilmsDatasource', () {
    test('When response is Success ', () async {
      when(() => dio.get(any())).thenAnswer(
        (_) async => Response(
          data: filmsMock,
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      final result = await datasource();
      expect(result, isA<List<MarvelFilmModel>>());
    });

    test('When response is DioError and excecao null', () async {
      when(() => dio.get(any())).thenThrow(
        DioError(
          error: 'error',
          requestOptions: RequestOptions(path: ''),
          response: Response(
            data: {'excecao': null},
            requestOptions: RequestOptions(path: ''),
          ),
        ),
      );
      final result = datasource();
      expect(result, throwsA(isA<BaseError>()));
    });
    test('When response is DioError', () async {
      when(() => dio.get(any())).thenThrow(
        DioError(
          error: 'error',
          requestOptions: RequestOptions(path: ''),
          response: Response(
            data: {
              'excecao': {
                'httpStatus': 400,
                'erros': [
                  {'mensagem': 'error', 'codigo': '440', 'titulo': 'teste'}
                ]
              }
            },
            requestOptions: RequestOptions(path: ''),
          ),
        ),
      );
      final result = datasource();
      expect(result, throwsA(isA<BaseError>()));
    });
    test('When response is any Error ', () async {
      when(() => dio.get(any())).thenThrow(
        Exception('error'),
      );
      final result = datasource();
      expect(result, throwsA(isA<BaseError>()));
    });
  });
}
