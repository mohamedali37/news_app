import 'package:dio/dio.dart';
import 'package:news_app/models/artical_model.dart';

class NewsService
{
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleModel>> getGeneralNews({required String category}) async {

  try {
  var response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f2c85fbf6122416d92a5ee5ea3828fd8');
  Map<String,dynamic> jsonData = response.data;
  List<dynamic> articles = jsonData['articles'];
  List<ArticleModel> articalList = [];
  for (var artical in articles)
  {
    ArticleModel articleModel = ArticleModel.fromjson(artical);
    articalList.add(articleModel);
  }
  return articalList;
}  catch (e) {
  return [];
}
}  
}
