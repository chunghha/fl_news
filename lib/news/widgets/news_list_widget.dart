import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../theme.dart';
import '../models/article.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({
    Key? key,
    required this.articles,
    required this.onTapArticle,
  }) : super(key: key);

  final List<Article> articles;
  final Function(Article article) onTapArticle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles.elementAt(index);
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven
                ? boxDecoColorDarker.withOpacity(0.5)
                : boxDecoColorLighter.withOpacity(0.5),
          ),
          child: ListTile(
            onTap: () {
              onTapArticle(article);
            },
            leading: SizedBox(
              height: 100,
              width: 100,
              child: article.urlToImage == null
                  ? const Placeholder()
                  : Image.network(article.urlToImage!),
            ),
            title: Text(
              article.title ?? '',
              style: titleTextstyle,
            ),
            subtitle: Text(
              // ignore: prefer_interpolation_to_compose_strings
              (article.source?.name ?? '') +
                  '  -  ' +
                  (article.publishedAt != null
                      ? _getTimeago(article.publishedAt!)
                      : ''),
              style: subtitleTextStyle,
            ),
          ),
        );
      },
    );
  }

  String _getTimeago(DateTime publishedAt) {
    return timeago.format(publishedAt);
  }
}
