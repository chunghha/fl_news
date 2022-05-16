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
  NewsListPage({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: defaultElevation,
        backgroundColor: primaryColor,
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
        children: <Widget>[
          AutoSizeTextField(
            controller: _controller,
            style: const TextStyle(fontSize: 16),
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
              icon: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
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
    final newsProvider = ref.watch(newsPod);

    Widget _newsList(List<Article>? articles) {
      return Expanded(
        child: articles != null && articles.isEmpty
            ? _showTextWidgeet('No news found!')
            : NewsListWidget(
                articles: articles!,
                onTapArticle: (article) {
                  _showNewsArticleDetails(context, article);
                },
              ),
      );
    }

    return newsProvider.when(
      data: (res) => _newsList(res.articles),
      loading: () => const Expanded(child: spinkit),
      error: (err, _) => Expanded(child: _showTextWidgeet(err)),
    );
  }

  Widget _showTextWidgeet(dynamic something) {
    return Column(children: [const SizedBox(height: 10), Text('$something')]);
  }

  void _showNewsArticleDetails(BuildContext context, Article article) {
    Navigator.of(context).push<dynamic>(_createRoute(context, article));
  }

  Route _createRoute(BuildContext context, Article article) {
    return PageRouteBuilder<dynamic>(
      pageBuilder: (context, animation, secondaryAnimation) =>
          NewsArticlePage(article: article),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 2000),
      reverseTransitionDuration: const Duration(milliseconds: 800),
    );
  }
}
