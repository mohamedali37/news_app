import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/views/webview_builder.dart';

// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return WebPage(
              url: articleModel.url,
            );
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  articleModel.image ??
                      'https://www.wealthyaccountant.com/wp-content/uploads/2017/01/news-636978_960_720.jpg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 12,
            ),
            Text(
              articleModel.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              articleModel.subTitle ?? '',
              maxLines: 2,
              style: const TextStyle(
                color: Colors.grey, 
                fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
