import 'dart:convert';

import 'package:decorly/models/article_post.dart';
import 'package:flutter/services.dart';

class ArticleAPI {

  String url = "";
  Future<DataArticle> getData(String category) async{
    if (category == "design") {
      url = "assets/jsons/sample_list_design.json";
    } else {
      url = "assets/jsons/sample_list_article.json";
    }
    final String resp = await rootBundle.loadString(url);
    final data = await jsonDecode(resp);
    final DataArticle dataArticle = DataArticle.fromJson(data);
    return dataArticle;
  }
}