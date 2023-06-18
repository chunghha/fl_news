import 'package:flutter/material.dart';

import '../../theme.dart';
import '../extensions/article.extension.dart';
import '../models/article.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({
    super.key,
    required this.articles,
    required this.onTapArticle,
  });

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
              article.toTitle(),
              style: titleTextStyle,
            ),
            subtitle: Text(
              article.toSource(),
              style: sourceTextStyle,
            ),
          ),
        );
      },
    );
  }
}
