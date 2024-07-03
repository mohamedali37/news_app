import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_listview.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News ',
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: CustomScrollView(
          
          physics: BouncingScrollPhysics(), 
          slivers: [
          SliverToBoxAdapter(
            child: CategoryListView(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          NewsListViewBuilder(
            category: 'general',
          )
        ]),
      ),
    );
  }
}
