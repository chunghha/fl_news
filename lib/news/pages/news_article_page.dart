import 'dart:io' show Platform;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/article.dart';

class NewsArticlePage extends StatelessWidget {
  final Article article;
  NewsArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    //* For desktops, show the picture instead of webview error
    return Platform.isMacOS || Platform.isLinux || Platform.isWindows
        ? _showPicture()
        : _showWebview();
  }

  Widget _showPicture() {
    return Scaffold(
      appBar: AppBar(
        elevation: 16.0,
        shadowColor: '#5e81ac'.toColor(),
        title: Text('${article.urlToImage ?? ''}',
            style: GoogleFonts.montserrat(
                fontSize: 14.0, fontWeight: FontWeight.w700)),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: article.urlToImage ?? '',
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.error), Text('\tNo Image Url')],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showWebview() {
    return Scaffold(
      appBar: AppBar(
        elevation: 16.0,
        shadowColor: '#5e81ac'.toColor(),
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
