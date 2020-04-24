import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:supercharged/supercharged.dart';

import 'package:fl_news/models/article.dart';

class NewsListWidget extends StatelessWidget {
  final List<Article> articles;
  final Function(Article article) onTapArticle;

  NewsListWidget({this.articles, this.onTapArticle});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles == null ? 0 : articles.length,
      itemBuilder: (context, index) {
        final article = articles.elementAt(index);
        return Container(
            decoration: BoxDecoration(
                color: index % 2 == 0
                    ? '#d8dee9'.toColor().withOpacity(0.5)
                    : '#eceff4'.toColor().withOpacity(0.5)),
            child: ListTile(
              onTap: () {
                this.onTapArticle(article);
              },
              leading: Container(
                height: 100,
                width: 100,
                child: article?.urlToImage == null
                    ? Placeholder()
                    : Image.network(article?.urlToImage),
              ),
              title: Text(
                article?.title ?? '',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(color: '#2e3440'.toColor()),
                    fontSize: 16.0),
              ),
              subtitle: Text(
                (article?.source?.name ?? '') +
                    '  -  ' +
                    (article?.publishedAt != null
                        ? _getTimeago(article.publishedAt)
                        : ''),
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(color: '#434c5e'.toColor(), fontSize: 16.0)),
              ),
            ));
      },
    );
  }

  _getTimeago(DateTime publishedAt) {
    return timeago.format(publishedAt);
  }
}
