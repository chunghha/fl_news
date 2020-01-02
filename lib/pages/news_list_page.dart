import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supercharged/supercharged.dart';

import 'package:fl_news/bloc/bloc.dart';
import 'package:fl_news/models/article.dart';
import 'package:fl_news/pages/news_article_page.dart';
import 'package:fl_news/widgets/news_list_widget.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsListBloc>(context).add(
      FetchNewsList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 16.0,
        title: Text('News',
            style: GoogleFonts.raleway(
                fontSize: 18.0, fontWeight: FontWeight.w700)),
      ),
      backgroundColor: '#eceff4'.toColor(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                print('Enter pressed');
                BlocProvider.of<NewsListBloc>(context).add(
                  FetchNewsList(search: value),
                );
              }
            },
            decoration: InputDecoration(
              labelText: 'Enter a keyword to search news',
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  print('SuffixIcon pressed');
                  _controller.text = '';
                },
              ),
            ),
          ),
          BlocBuilder<NewsListBloc, NewsListState>(
            builder: (context, state) {
              if (state is NewsListLoading) {
                return Expanded(
                  child: Align(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is NewsListLoaded) {
                return Expanded(
                  child: NewsListWidget(
                    articles: state.articles,
                    onTapArticle: (Article article) {
                      _showNewsArticleDetails(context, article);
                    },
                  ),
                );
              } else if (state is NewsListEmpty) {
                return Expanded(
                    child: Align(
                  child: Text(
                    'No news found!',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: '#d08770'.toColor())),
                  ),
                ));
              } else {
                return Expanded(
                  child: Align(
                    child: Text(
                      'Something went wrong!',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: '#bf616a'.toColor())),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _showNewsArticleDetails(BuildContext context, Article article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsArticlePage(article: article),
      ),
    );
  }
}
