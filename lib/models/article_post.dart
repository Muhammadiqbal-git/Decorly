class DataArticle {
  final List<Article> data;
  DataArticle({required this.data});

  factory DataArticle.fromJson(Map<String, dynamic> json) => DataArticle(
      data: List<Article>.from(json["data"].map((x) => Article.fromJson(x))));
}

class Article {
  final String id;
  final String img;
  final String title;
  final String author;
  Article(
      {required this.id,
      required this.img,
      required this.title,
      required this.author});
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        id: json['id'] ?? '',
        img: json['img'] ?? '',
        title: json['title'] ?? '',
        author: json['author'] ?? '');
  }
}
