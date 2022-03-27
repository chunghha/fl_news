import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart';

part 'news_response.freezed.dart';
part 'news_response.g.dart';

@freezed
class NewsResponse with _$NewsResponse {
  factory NewsResponse({
    String? status,
    int? totalResults,
    List<Article>? articles,
  }) = _NewsResponse;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}
