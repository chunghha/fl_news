import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../models/news_response.dart';
import '../services/news.repository.dart';
import 'keyword.provider.dart';

final _logger = Logger();

final newsPod = FutureProvider<NewsResponse>(_fetchNews);

Future<NewsResponse> _fetchNews(FutureProviderRef ref) {
  final newsRepository = ref.read(newsRepoPod);
  final keyword = ref.watch(keywordProvider);

  if (keyword != '') {
    _logger.i('keyword to search: $keyword');
    return newsRepository.getNewsByKeyword(keyword);
  }

  return newsRepository.getNews();
}
