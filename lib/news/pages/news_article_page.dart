import 'dart:io' show Platform;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../theme.dart';
import '../models/article.dart';

class NewsArticlePage extends StatelessWidget {
  const NewsArticlePage({super.key, required this.article});

  final Article article;

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
        elevation: defaultElevation,
        backgroundColor: primaryColor,
        shadowColor: shadowColor,
        title: Text(
          article.urlToImage ?? '',
          style: headerTextStyle,
        ),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: article.urlToImage ?? '',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, dynamic _) => Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Icon(Icons.error),
                const Text('\tNo Image Url'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _showWebview() {
    return Scaffold(
      appBar: AppBar(
        elevation: defaultElevation,
        backgroundColor: primaryColor,
        shadowColor: shadowColor,
        title: Text(
          article.title!,
          style: headerTextStyle,
        ),
      ),
      body: Center(
        child: WebView(
          initialUrl: article.url,
        ),
      ),
    );
  }
}
