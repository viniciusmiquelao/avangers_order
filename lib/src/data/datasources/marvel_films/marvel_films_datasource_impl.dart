import 'package:avangers_order/src/data/models/marvel_film_model.dart';
import 'package:avangers_order/src/data/services/app_http_client/app_http_client_service.dart';
import 'package:avangers_order/src/shared/errors/base_error.dart';
import 'package:dio/dio.dart';
import 'marvel_films_datasource.dart';

class MarvelFilmsDatasourceImpl implements IMarvelFilmsDatasource {
  final IAppHttpClientService dio;

  MarvelFilmsDatasourceImpl(this.dio);

  @override
  Future<List<MarvelFilmModel>> call() async {
    try {
      const url = 'www.example.com.br';
      final response = await dio.get(url);

      final result = response.data['mcu'] as List;

      return result.map((e) => MarvelFilmModel.fromMap(e)).toList();
    } on DioError catch (error) {
      throw BaseError('MarvelFilmsDataSource Error: $error');
    } catch (error) {
      throw BaseError('$error');
    }
  }
}
