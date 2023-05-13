import 'package:avangers_order/src/data/services/json_file_service/json_file_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'app_http_client_service.dart';

class AppDioClientService implements IAppHttpClientService<Dio> {
  final Dio _dio;

  AppDioClientService(this._dio);

  AppDioClientService.withDefaultOptions(this._dio) {
    _dio.interceptors.add(_defaultInterceptorWrapper());
  }

  InterceptorsWrapper _defaultInterceptorWrapper() =>
      InterceptorsWrapper(onRequest: (opts, handler) async {
        _onRequestLog(opts);
        return handler.next(opts);
      }, onError: (error, handler) async {
        _onErrorLog(error);
        return handler.next(error);
      }, onResponse: (res, handler) async {
        _onResponseLog(res);
        return handler.next(res);
      });

  void _onRequestLog(RequestOptions options) {
    debugPrint('====================  REQUEST LOG  ====================');
    debugPrint('METHOD CALLED: ${options.method}');
    debugPrint('PATH CALLED: ${options.path}');
    debugPrint('BODY: ${options.data}');
    debugPrint('HEADER: ${options.headers}');
    debugPrint('=======================================================');
  }

  void _onResponseLog(Response res) {
    debugPrint('====================  RESPONSE LOG  ====================');
    debugPrint('METHOD CALLED: ${res.requestOptions.method}');
    debugPrint('PATH CALLED: ${res.requestOptions.path}');
    debugPrint('STATUS CODE: ${res.statusCode}');
    debugPrint('BODY: ${res.data}');
    debugPrint('========================================================');
  }

  void _onErrorLog(DioError e) {
    debugPrint('====================  Error LOG  ====================');
    debugPrint('METHOD CALLED: ${e.requestOptions.method}');
    debugPrint('PATH CALLED: ${e.requestOptions.path}');
    debugPrint('ERROR CODE: ${e.error}');
    debugPrint('ERROR MESSAGE: ${e.response?.data}');
    debugPrint('=====================================================');
  }

  @override
  Dio get adapter => _dio;

  @override
  Future delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) {
    return _dio.delete(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }

  @override
  Future get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final dioAdapter = DioAdapter(dio: _dio);

    final mockData = await JsonFileService.loadFilmsMock();

    dioAdapter.onGet(
      url,
      (server) => server.reply(
        200,
        mockData,
        delay: const Duration(seconds: 2),
      ),
    );

    return _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }

  @override
  Future patch(
    String url, {
    Map? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.patch(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }

  @override
  Future post(String url,
      {Map? body,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      String? contentType}) {
    return _dio.post(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers, contentType: contentType),
    );
  }

  @override
  Future postString(String url,
      {String? body,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      String? contentType}) {
    return _dio.post(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers, contentType: contentType),
    );
  }

  @override
  Future put(
    String url, {
    Map? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.put(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }

  @override
  Future download(
    String url, {
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.download(
      url,
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }
}
