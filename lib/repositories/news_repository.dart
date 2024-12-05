import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class NewsRepository {
  Future<List<ArticleModel>> fetchNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=23bb8c881ec4468d9dac83164f0f22a4"));

    var data = jsonDecode(response.body);

    List<ArticleModel> _articleModelList = [];

    if (response.statusCode == 200) {
      for (var item in data["articles"]) {
        ArticleModel _artcileModel = ArticleModel.fromJson(item);
        _articleModelList.add(_artcileModel);
      }
      print(_articleModelList);
      return _articleModelList;
    } else {
      print(_articleModelList.toString());
      return _articleModelList; // empty list
    }
  }
}
