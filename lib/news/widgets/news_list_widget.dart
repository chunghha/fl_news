import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../models/article.dart';

class NewsListWidget extends StatelessWidget {
  final List<Article> articles;
  final Function(Article article) onTapArticle;

  const NewsListWidget({
    Key? key,
    required this.articles,
    required this.onTapArticle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles.elementAt(index);
        return Container(
          decoration: BoxDecoration(
            color: index % 2 == 0
                ? '#d8dee9'.toColor().withOpacity(0.5)
                : '#eceff4'.toColor().withOpacity(0.5),
          ),
          child: ListTile(
            onTap: () {
              onTapArticle(article);
            },
            leading: SizedBox(
              height: 100,
              width: 100,
              child: article.urlToImage == null
                  ? Placeholder()
                  : Image.network(article.urlToImage!),
            ),
            title: Text(
              article.title ?? '',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: '#2e3440'.toColor()),
                fontSize: 16.0,
              ),
            ),
            subtitle: Text(
              // ignore: prefer_interpolation_to_compose_strings
              (article.source?.name ?? '') +
                  '  -  ' +
                  (article.publishedAt != null
                      ? _getTimeago(article.publishedAt!)
                      : ''),
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: '#434c5e'.toColor(),
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _getTimeago(DateTime publishedAt) {
    return timeago.format(publishedAt);
  }
}
