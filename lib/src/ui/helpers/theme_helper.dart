import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeHelper {
  static ThemeData getTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      primaryColor: Colors.red,
    );
  }
}
