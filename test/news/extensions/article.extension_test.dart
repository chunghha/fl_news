import 'package:fl_news/news/extensions/article.extension.dart';
import 'package:fl_news/news/models/article.dart';
import 'package:fl_news/news/models/source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('article.extension', () {
    test('toSource() should return a source with timeago', () {
      final aDayAgo = DateTime.now().subtract(const Duration(days: 1));
      final article =
          Article(source: Source(name: 'CNN'), publishedAt: aDayAgo);
      final source = article.toSource();

      expect(source, 'CNN - a day ago');
    });

    test('toTitle() should return a title without " - "', () {
      final article = Article(title: 'Hello - CNN');
      final title = article.toTitle();

      expect(title, 'Hello');
    });

    test('toTitle() should return a title without " | "', () {
      final article = Article(title: 'Hello | Youtube');
      final title = article.toTitle();

      expect(title, 'Hello');
    });

    test('toTitle() should return a title without both " - " and " | "', () {
      final article = Article(title: 'Hello - CNN | Youtube');
      final title = article.toTitle();

      expect(title, 'Hello');
    });
  });
}
