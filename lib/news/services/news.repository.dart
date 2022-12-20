import 'package:diox/diox.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/adapter.exception.dart';
import '../adapters/news.adapter.dart';
import '../models/news_response.dart';
import '../news.constants.dart';

final newsRepoPod = Provider(
  (ref) => NewsRepository(
    baseUrl: dotenv.get(configNewsBaseUrl),
    apiKey: dotenv.get(configNewsApiKey),
  ),
);

class NewsRepository {
  NewsRepository({required this.baseUrl, required this.apiKey});

  late final String baseUrl;
  late final String apiKey;

  Future<NewsResponse> getNewsByKeyword(String keyword) async {
    final newsAdapter = NewsAdapter(baseUrl: baseUrl, apiKey: apiKey);

    try {
      final res = (await newsAdapter.getNewsByKeyword(keyword)).data
          as Map<String, dynamic>;

      return NewsResponse.fromJson(res);
    } on DioError catch (dioError) {
      throw AdapterException.fromDioError(dioError);
    }
  }

  Future<NewsResponse> getNews() async {
    final newsAdapter = NewsAdapter(baseUrl: baseUrl, apiKey: apiKey);

    try {
      final res =
          (await newsAdapter.getHeadliness()).data as Map<String, dynamic>;

      return NewsResponse.fromJson(res);
    } on DioError catch (dioError) {
      throw AdapterException.fromDioError(dioError);
    }
  }
}
