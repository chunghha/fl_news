import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:fl_news/models/article.dart';

abstract class NewsListState extends Equatable {
  const NewsListState();

  @override
  List<Object> get props => [];
}

class NewsListEmpty extends NewsListState {}

class NewsListLoading extends NewsListState {}

class NewsListLoaded extends NewsListState {
  final List<Article> articles;

  const NewsListLoaded({@required this.articles}) : assert(articles != null);

  @override
  List<Object> get props => [articles];
}

class NewsListError extends NewsListState {}
