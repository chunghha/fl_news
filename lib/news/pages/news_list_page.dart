import 'package:animations/animations.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../theme.dart';
import '../models/article.dart';
import '../providers/keyword.provider.dart';
import '../providers/news.provider.dart';
import '../widgets/news_list_widget.dart';
import '../widgets/spinkit.widget.dart';
import 'news_article_page.dart';

final _logger = Logger();

class NewsListPage extends HookConsumerWidget {
  final _controller = TextEditingController();

  NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: defaultElevation,
        shadowColor: shadowColor,
        centerTitle: true,
        title: Text(
          'News',
          style: bigHeaderTextStyle,
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AutoSizeTextField(
            controller: _controller,
            style: TextStyle(fontSize: 16),
            maxLines: 1,
            minFontSize: 14,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                _logger.d('Enter pressed for $value');
                _controller.text = value;
                ref.read(keywordProvider.notifier).state = value;
              }
            },
            decoration: InputDecoration(
              labelText: 'Enter a keyword to search news',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _logger.d('SuffixIcon pressed');
                  _controller.text = '';
                  ref.read(keywordProvider.notifier).state = '';
                },
              ),
            ),
          ),
          _getNewsList(context, ref),
        ],
      ),
    );
  }

  Widget _getNewsList(BuildContext context, WidgetRef ref) {
    var _news = ref.watch(newsProvider);

    return _news.when(
      data: (data) => Expanded(
        child: data.length == 0
            ? _showTextWidgeet('No news found!')
            : NewsListWidget(
                articles: data,
                onTapArticle: (article) {
                  _showNewsArticleDetails(context, article);
                },
              ),
      ),
      loading: () => Expanded(child: spinkit),
      error: (_err, _stack) => Expanded(child: _showTextWidgeet(_err)),
    );
  }

  Widget _showTextWidgeet(dynamic something) {
    return Column(children: [SizedBox(height: 10), Text('$something')]);
  }

  void _showNewsArticleDetails(BuildContext context, Article article) {
    Navigator.of(context).push(_createRoute(context, article));
  }

  Route _createRoute(BuildContext context, Article article) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          NewsArticlePage(article: article),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 2000),
      reverseTransitionDuration: Duration(milliseconds: 800),
    );
  }
}
