import 'package:avangers_order/src/data/models/marvel_film_model.dart';
import 'package:avangers_order/src/shared/result_wrapper/result_wrapper.dart';

abstract class IMarvelFilmsUsecase {
  Future<Result<List<MarvelFilmModel>>> call();
}
