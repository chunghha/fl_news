import 'package:dio/dio.dart';

import '../shared/adapter.exception.dart';
import 'models/article.dart';

class NewsAdapter {
  late final Dio _dio;

  NewsAdapter(Dio dio) {
    _dio = dio;
  }

  Future<List<Article>> getNewsByKeyword(
    String baseEndpoint,
    String keyword,
  ) async {
    try {
      var _endpoint = '$baseEndpoint${'/everything?q=$keyword'}';
      var _res = await _dio.get(_endpoint);

      final Iterable _json = _res.data['articles'];
      var _articles =
          _json.map((article) => Article.fromJson(article)).toList();

      return _articles;
    } on DioError catch (dioError) {
      throw AdapterException.fromDioError(dioError);
    }
  }

  Future<List<Article>> getHeadliness(String baseEndpoint) async {
    try {
      var _endpoint = '$baseEndpoint${'/top-headlines?country=us'}';
      var _res = await _dio.get(_endpoint);

      final Iterable _json = _res.data['articles'];
      var _articles =
          _json.map((article) => Article.fromJson(article)).toList();

      return _articles;
    } on DioError catch (dioError) {
      throw AdapterException.fromDioError(dioError);
    }
  }
}
