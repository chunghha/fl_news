import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:supercharged/supercharged.dart';

import '../models/article.dart';
import '../providers/keyword.provider.dart';
import '../providers/news.provider.dart';
import '../widgets/news_list_widget.dart';
import '../widgets/spinkit.widget.dart';
import 'news_article_page.dart';

final _logger = Logger();

class NewsListPage extends HookWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 16.0,
        title: Text('News',
            style: GoogleFonts.montserrat(
                fontSize: 18.0, fontWeight: FontWeight.w700)),
      ),
      backgroundColor: '#eceff4'.toColor(),
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
                context.read(keywordProvider).state = value;
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
                  context.read(keywordProvider).state = '';
                },
              ),
            ),
          ),
          _getNewsList(context),
        ],
      ),
    );
  }

  Widget _getNewsList(BuildContext context) {
    var _news = useProvider(newsProvider);

    return _news.when(
      data: (data) => Expanded(
          child: data.length == 0
              ? _showTextWidgeet('No news found!')
              : NewsListWidget(
                  articles: data,
                  onTapArticle: (article) {
                    _showNewsArticleDetails(context, article);
                  },
                )),
      loading: () => Expanded(child: spinkit),
      error: (dynamic err, stack) => Expanded(child: _showTextWidgeet(err)),
    );
  }

  Widget _showTextWidgeet(dynamic something) {
    return Column(children: [SizedBox(height: 10), Text('$something')]);
  }

  void _showNewsArticleDetails(BuildContext context, Article article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsArticlePage(article: article),
      ),
    );
  }
}
