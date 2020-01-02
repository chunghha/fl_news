import 'package:equatable/equatable.dart';

abstract class NewsListEvent extends Equatable {
  const NewsListEvent();
}

class FetchNewsList extends NewsListEvent {
  final String search;

  const FetchNewsList({this.search});

  @override
  List<Object> get props => [search];
}
