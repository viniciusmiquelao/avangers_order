import 'package:avangers_order/src/data/models/marvel_film_model.dart';
import 'package:avangers_order/src/domain/repositories/repositories.dart';
import 'package:avangers_order/src/domain/usecases/marvel_films/marvel_films_usecase.dart';
import 'package:avangers_order/src/shared/result_wrapper/result_wrapper.dart';

class MarvelFilmsUsecase implements IMarvelFilmsUsecase {
  final IMarvelFilmsRepository _repository;

  MarvelFilmsUsecase(this._repository);

  @override
  Future<Result<List<MarvelFilmModel>>> call() async {
    final result = await _repository();
    return result;
  }
}
