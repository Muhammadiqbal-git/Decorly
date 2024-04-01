import 'package:decorly/models/article_post.dart';
import 'package:decorly/models/designer.dart';
import 'package:decorly/models/furniture_item.dart';

class DataSavedList {
  Map<String, Furniture> furniture;
  Map<String, Article> article;
  Map<String, Article> design;
  Map<String, Designer> designer;

  DataSavedList(
      {required this.furniture, required this.article, required this.design, required this.designer});
}
