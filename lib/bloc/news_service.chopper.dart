// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$NewsService extends NewsService {
  _$NewsService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NewsService;

  @override
  Future<Response> getNewsByKeyword(String keyword, String apiKey) {
    final $url = '/everything?q=$keyword&apiKey=$apiKey';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getHeadlines(String apiKey) {
    final $url = '/top-headlines?country=us&apiKey=$apiKey';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
