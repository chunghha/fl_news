import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:fl_news/bloc/news_list_endpoint.dart';
import 'package:fl_news/bloc/news_service.dart';
import 'package:fl_news/models/article.dart';

class NewsListRepository {
  final newsService = NewsService.create(ChopperClient(
    baseUrl: NewsListEndpoint.newsBaseUrl,
    services: [NewsService.create()],
  ));

  Future<List<Article>> fetchNewsByKeyword({String keyword}) async {
    print('fetch News by Keyword: $keyword');
    final response = await newsService.getNewsByKeyword(
        keyword, DotEnv().env['NEWS_API_KEY']);

    if (response.statusCode == 200) {
      return _convertResponseToArticles(response);
    } else {
      throw Exception('Failed to get news');
    }
  }

  Future<List<Article>> fetchTopHeadLines() async {
    print('fetch Top HeadLines in US');
    final response =
        await newsService.getHeadlines(DotEnv().env['NEWS_API_KEY']);

    if (response.statusCode == 200) {
      return _convertResponseToArticles(response);
    } else {
      throw Exception('Failed to get headlines');
    }
  }

  List<Article> _convertResponseToArticles(response) {
    final decoded = jsonDecode(response.body);
    final Iterable json = decoded['articles'];
    List<Article> articles =
        json.map((article) => Article.fromJson(article)).toList();
    print(' +-- number of articles: ${articles.length}');

    return articles;
  }
}
