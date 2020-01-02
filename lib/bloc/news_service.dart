import "dart:async";

import 'package:chopper/chopper.dart';


part 'news_service.chopper.dart';

@ChopperApi()
abstract class NewsService extends ChopperService {
  static NewsService create([ChopperClient client]) => _$NewsService(client);

  @Get(path: '/everything?q={keyword}&apiKey={apiKey}')
  Future<Response> getNewsByKeyword(@Path('keyword') String keyword, @Path('apiKey') String apiKey);

  @Get(path: '/top-headlines?country=us&apiKey={apiKey}')
  Future<Response> getHeadlines(@Path('apiKey') String apiKey);
}