import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supercharged/supercharged.dart';

import 'package:fl_news/bloc/bloc.dart';
import 'package:fl_news/pages/news_list_page.dart';

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  await DotEnv().load('.env');
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: '#2e3440'.toColor()),
      home: BlocProvider(
        create: (context) => NewsListBloc(repository: NewsListRepository()),
        child: NewsListPage(),
      ),
    );
  }
}
