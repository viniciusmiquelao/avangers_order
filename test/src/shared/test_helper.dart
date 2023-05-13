import 'dart:convert';
import 'package:avangers_order/src/data/services/custom_localization/custom_localization.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

class TestSharedHelper {
  static void ignoreOverflowErrors() {
    FlutterError.onError = (
      FlutterErrorDetails details, {
      bool forceReport = false,
    }) {
      bool ifIsOverflowError = false;

      // Detect overflow error.
      var exception = details.exception;
      if (exception is FlutterError) {
        ifIsOverflowError = !exception.diagnostics.any(
          (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
        );
      }

      // Ignore if is overflow error.
      if (!ifIsOverflowError) {
        FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
      }
    };
  }

  static Widget buildTestableWidget({
    required Widget widget,
    Size? size,
  }) =>
      MaterialApp(
        localizationsDelegates: [
          CustomLocalizationDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: MediaQuery(
          data: MediaQueryData(
            size: size ?? Size.zero,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: widget,
          ),
        ),
      );

  static Widget buildTestDragWidget({
    required Widget widget,
  }) =>
      MaterialApp(
        localizationsDelegates: [
          CustomLocalizationDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: widget,
      );

  static Widget buildTestWidget({
    required Widget widget,
    List<NavigatorObserver>? navigatorObservers,
  }) =>
      MaterialApp(
        localizationsDelegates: [
          CustomLocalizationDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Directionality(
          textDirection: TextDirection.ltr,
          child: widget,
        ),
        navigatorObservers: navigatorObservers ?? [],
      );

  static Widget buildTestableWithScaffoldWidget({
    required Widget widget,
    Size? size,
  }) =>
      MaterialApp(
        localizationsDelegates: [
          CustomLocalizationDelegate(isTest: true),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: Scaffold(
          body: MediaQuery(
            data: MediaQueryData(size: size ?? Size.zero),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: widget,
            ),
          ),
        ),
      );

  static Future createMockDioResponse(String json, int httpStatus,
      {RequestOptions? requestOptions, bool decode = true}) async {
    return Response(
      data: decode ? jsonDecode(json) : json,
      statusCode: httpStatus,
      requestOptions: requestOptions ?? RequestOptions(path: ':path'),
    );
  }

  static DioError createMockDioError(
    String json,
    int httpStatus, {
    DioErrorType? type,
    RequestOptions? requestOptions,
  }) {
    return DioError(
      requestOptions: requestOptions ?? RequestOptions(path: ':path'),
      response: Response(
        statusCode: httpStatus,
        data: json,
        requestOptions: requestOptions ?? RequestOptions(path: ':path'),
      ),
      type: type ?? DioErrorType.badResponse,
    );
  }
}

enum TestHelperDevices {
  phone(size: Size(1440, 2560), ratio: 1.0),
  tablet(size: Size(2560, 1800), ratio: 1.0);

  final Size size;
  final double ratio;

  const TestHelperDevices({required this.size, required this.ratio});
}
