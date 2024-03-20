import 'package:decorly/models/article_post.dart';
import 'package:decorly/models/designer.dart';
import 'package:decorly/models/furniture_item.dart';

class DataSavedList {
  List<Furniture> furniture;
  List<Article> article;
  List<Article> design;
  List<Designer> designer;

  DataSavedList(
      {required this.furniture, required this.article, required this.design, required this.designer});
}
