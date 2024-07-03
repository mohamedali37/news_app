/*import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/servies/news_service.dart';
import 'package:news_app/widgets/news_listview.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key});

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListViewBuilder> {
  List<ArticleModel> articles = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    generalNews();
  }

  Future<void> generalNews() async {
    articles = await NewsService(Dio()).getGeneralNews();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : articles.isNotEmpty?
        NewsListView(articles: articles) 
        : const SliverToBoxAdapter(child: Center(child: Text('opps! News is empty')),); 
  }
}*/

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/servies/news_service.dart';
import 'package:news_app/widgets/error.dart';
import 'package:news_app/widgets/news_listview.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // ignore: prefer_typing_uninitialized_variables
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getGeneralNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return const ErrorMsg(error: 'opps! news is empty');
          }
          else {
            return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child:CircularProgressIndicator()),
                );
          }
        }
    );
        }}

