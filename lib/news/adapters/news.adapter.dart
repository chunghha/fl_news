import 'package:dio/dio.dart';

import '../../shared/adapter.interceptor.dart';

class NewsAdapter {
  NewsAdapter({
    required this.baseUrl,
    required this.apiKey,
    Dio? dio,
  }) {
    _dio = dio ?? _getDio();
  }

  late final String baseUrl;
  late final String apiKey;
  late final Dio _dio;

  Future<Response<dynamic>> getNewsByKeyword(String keyword) {
    return _dio.get<dynamic>('$baseUrl${'/everything?q=$keyword'}');
  }

  Future<Response> getHeadliness() {
    return _dio.get<dynamic>('$baseUrl${'/top-headlines?country=us'}');
  }

  // ignore: type_annotate_public_apis
  void close() {
    _dio.close();
  }

  Dio _getDio() {
    final dio = Dio();
    dio.interceptors.add(AdapterInterceptor());
    dio.options.headers['X-Api-Key'] = apiKey;

    return dio;
  }
}
