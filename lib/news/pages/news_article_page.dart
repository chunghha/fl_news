import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/article.dart';

class NewsArticlePage extends StatelessWidget {
  final Article article;
  NewsArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 16.0,
        title: Text('${article.title}',
            style: GoogleFonts.montserrat(
                fontSize: 14.0, fontWeight: FontWeight.w700)),
      ),
      body: Center(
        child: WebView(
          initialUrl: article.url,
        ),
      ),
    );
  }
}
