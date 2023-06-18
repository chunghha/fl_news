import 'package:timeago/timeago.dart' as timeago;

import '../models/article.dart';

extension ArticleExtension on Article {
  String _getTimeago(DateTime? publishedAt) {
    return publishedAt == null ? '' : timeago.format(publishedAt);
  }

  String toSource() {
    return '${source?.name ?? ''} - ${_getTimeago(publishedAt)}';
  }

  String toTitle() {
    return title?.split(' - ').first.split(' | ').first ?? '';
  }
}
