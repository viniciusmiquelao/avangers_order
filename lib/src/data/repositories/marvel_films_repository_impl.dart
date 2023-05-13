import 'package:avangers_order/src/data/models/marvel_film_model.dart';
import 'package:avangers_order/src/domain/repositories/repositories.dart';
import 'package:avangers_order/src/shared/errors/base_error.dart';
import 'package:avangers_order/src/shared/result_wrapper/result_wrapper.dart';
import '../datasources/marvel_films/marvel_films_datasource.dart';

class MarvelFilmsRepositoryImpl implements IMarvelFilmsRepository {
  final IMarvelFilmsDatasource _datasource;

  MarvelFilmsRepositoryImpl(this._datasource);

  @override
  Future<Result<List<MarvelFilmModel>>> call() async {
    try {
      final result = await _datasource();

      return ResultSuccess<List<MarvelFilmModel>>(result);
    } on BaseError catch (e) {
      return ResultError(e);
    } catch (e) {
      return ResultError(BaseError(e.toString()));
    }
  }
}
