import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class JsonFileService {
  static Future<Map<String, dynamic>> loadFilmsMock() async {
    final jsonString = await rootBundle.loadString('assets/mocks/mock.json');
    return jsonDecode(jsonString);
  }
}
