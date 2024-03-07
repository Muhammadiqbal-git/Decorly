class DataArticle {
  List<Article> data;
  DataArticle({required this.data});

  factory DataArticle.fromJson(Map<String, dynamic> json) => DataArticle(
      data:
          List<Article>.from(json["data"].map((x) => Article.fromJson(x))));
}

class Article {
  final String img;
  final String title;
  final String author;
  Article(
      {required this.img,
      required this.title,
      required this.author});
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        img: json['img'] ?? '',
        title: json['title'] ?? '',
        author: json['author'] ?? '');
  }
}
