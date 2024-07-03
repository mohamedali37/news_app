import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/widgets/category_news.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles;
  const NewsListView({super.key , required this.articles});
  @override
  Widget build(BuildContext context) {
    return SliverList( 
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index){
          return NewsTile(articleModel: articles[index]);
        }));
  }
}