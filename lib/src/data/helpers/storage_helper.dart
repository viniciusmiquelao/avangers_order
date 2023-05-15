import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class StorageHelper {
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  static Future<void> save(
      {required String boxName,
      required String key,
      required dynamic value}) async {
    debugPrint('**** save');
    try {
      var box = await Hive.openBox(boxName);
      box.put(key, value);
    } catch (_) {
      debugPrint('Error save');
    }
  }

  static Future<Box> getBox({required String boxName}) async {
    debugPrint('**** getBox');

    var box = await Hive.openBox(boxName, keyComparator: (k1, k2) => 1);
    return box;
  }

  static Future<String> get(
      {required String boxName, required String key}) async {
    debugPrint('**** get');
    try {
      var box = await Hive.openBox(boxName);
      var result = box.get(key);
      if (result == null) {
        return '';
      }
      return result;
    } catch (_) {
      return '';
    }
  }

  static Future<void> delete(
      {required String boxName, required String key}) async {
    debugPrint('**** delete');
    try {
      var box = await Hive.openBox(boxName);
      box.delete(key);
    } catch (_) {
      debugPrint('Error delete');
    }
  }
}
