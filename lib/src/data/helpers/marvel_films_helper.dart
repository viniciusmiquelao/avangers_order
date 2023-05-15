import 'dart:io';

import 'package:avangers_order/src/data/helpers/storage_helper.dart';
import 'package:avangers_order/src/data/models/marvel_film_model.dart';

class MarvelFilmsStorageHelper {
  static const String boxName = 'order_marvel_films';

  static Future<void> storeFilms(List<MarvelFilmModel> films) async {
    for (var i = 0; i < films.length; i++) {
      final film = films[i];
      await StorageHelper.save(
        boxName: boxName,
        key: i.toString(),
        value: film.toMap(),
      );
    }
  }

  static Future<List<MarvelFilmModel>> getFilms() async {
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      return [];
    }
    final box = await StorageHelper.getBox(boxName: boxName);
    var films = box.values
        .map(
          (e) => MarvelFilmModel.fromMap(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();

    return films;
  }

  static Future<dynamic> clearFilms() async {
    final box = await StorageHelper.getBox(boxName: boxName);
    await box.clear();
  }
}
