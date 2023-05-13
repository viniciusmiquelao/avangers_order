import 'package:avangers_order/src/data/models/marvel_film_model.dart';

abstract class IMarvelFilmsDatasource {
  Future<List<MarvelFilmModel>> call();
}
