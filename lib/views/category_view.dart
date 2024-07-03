import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  //final String titleAppBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          category,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 27,
          ),//
        ),
    ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          NewsListViewBuilder(category: category,),
        ],
            ),
      ));
  }
}