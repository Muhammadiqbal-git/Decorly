class DataArticle {
  final List<Article> data;
  DataArticle({required this.data});

  factory DataArticle.fromJson(Map<String, dynamic> json) => DataArticle(
      data: List<Article>.from(json["data"].map((x) => Article.fromJson(x))));
  Map<String, dynamic> toJson() =>
      {"data": List<dynamic>.from(data.map((e) => e.toJson()))};
}

class Article {
  final String id;
  final String img;
  final String title;
  final String author;
  final bool bookmark;
  Article(
      {required this.id,
      required this.img,
      required this.title,
      required this.author,
      required this.bookmark});
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        id: json['id'] ?? '',
        img: json['img'] ?? '',
        title: json['title'] ?? '',
        author: json['author'] ?? '',
        bookmark: json['bookmark'] ?? false);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'img': img,
        'title': title,
        'author': author,
        'bookmark': bookmark,
      };
}
