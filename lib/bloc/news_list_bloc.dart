import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';

import 'package:fl_news/bloc/bloc.dart';
import 'package:fl_news/models/article.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final NewsListRepository repository;

  NewsListBloc({@required this.repository}) : assert(repository != null);

  @override
  NewsListState get initialState => NewsListEmpty();

  @override
  Stream<NewsListState> mapEventToState(
    NewsListEvent event,
  ) async* {
    if (event is FetchNewsList) {
      yield NewsListLoading();
      try {
        List<Article> articles;

        if (event.search != null) {
          articles = await repository.fetchNewsByKeyword(keyword: event.search);
        } else {
          articles = await repository.fetchTopHeadLines();
        }

        if (articles.isEmpty) {
          yield NewsListEmpty();
        } else {
          yield NewsListLoaded(articles: articles);
        }
      } catch (_) {
        yield NewsListError();
      }
    }
  }
}
