abstract class IAppHttpClientService<T> {
  T get adapter;

  Future<dynamic> get(
    String url, {
    Map<String, dynamic> queryParameters,
    Map<String, String> headers,
  });

  Future<dynamic> post(String url,
      {Map body,
      Map<String, dynamic> queryParameters,
      Map<String, String> headers,
      String? contentType});

  Future<dynamic> postString(String url,
      {String body,
      Map<String, dynamic> queryParameters,
      Map<String, String> headers,
      String? contentType});

  Future<dynamic> put(
    String url, {
    Map body,
    Map<String, dynamic> queryParameters,
    Map<String, String> headers,
  });

  Future<dynamic> download(
    String url, {
    required String path,
    Map<String, dynamic> queryParameters,
    Map<String, String> headers,
  });

  Future<dynamic> patch(
    String url, {
    Map body,
    Map<String, dynamic> queryParameters,
    Map<String, String> headers,
  });

  Future<dynamic> delete(
    String url, {
    Map<String, dynamic> queryParameters,
    Map<String, String> headers,
    Map<String, dynamic> body,
  });
}
