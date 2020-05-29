import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:fl_news/models/article.dart';

class NewsArticlePage extends StatelessWidget {
  final Article article;
  NewsArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 16.0,
        title: Text('${this.article.title}',
            style: GoogleFonts.montserrat(
                fontSize: 14.0, fontWeight: FontWeight.w700)),
      ),
      body: Center(
        child: WebView(
          initialUrl: this.article.url,
        ),
      ),
    );
  }
}
