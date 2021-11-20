import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../shared/adapter.interceptor.dart';
import '../../shared/configuration.provider.dart';
import '../../shared/models/configuration.dart';
import '../news.adapter.dart';
import '../news.constants.dart';
import 'keyword.provider.dart';

final _logger = Logger();

Dio _getDio(AsyncValue<Configuration> configuration) {
  final _apiKey = configuration.value!.newsApiKey;
  if (_apiKey.isNotEmpty) {
    _logger.i(_apiKey);
  }

  final _dio = Dio();
  _dio.interceptors.add(AdapterInterceptor());
  _dio.options.headers['X-Api-Key'] = _apiKey;

  return _dio;
}

Future<dynamic> _fetchNews(FutureProviderRef ref) async {
  final _cfg = ref.watch(configurationProvider);
  final _keyword = ref.watch(keywordProvider);
  final _newsAdapter = NewsAdapter(_getDio(_cfg));

  if (_keyword != '') {
    _logger.i('keyword to search: $_keyword');
    return _newsAdapter.getNewsByKeyword(newsBaseEndpoint, _keyword);
  }

  return _newsAdapter.getHeadliness(newsBaseEndpoint);
}

final newsProvider = FutureProvider<dynamic>(_fetchNews);
