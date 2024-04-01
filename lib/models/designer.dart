import 'package:decorly/models/furniture_item.dart';

class DataDesigner {
  final List<Designer> data;

  DataDesigner({required this.data});
  factory DataDesigner.fromJson(Map<String, dynamic> json) => DataDesigner(
      data: List<Designer>.from(json["data"].map((x) => Designer.fromJson(x))));

  Map<String, dynamic> toJson() =>
      {'data': List.from(data.map((e) => e.toJson()))};
}

class Designer {
  final String id;
  final String img;
  final String name;
  final String fee;
  final String rate;
  final String reviewCount;
  final String biography;
  final String location;
  final String experience;
  final bool bookmark;

  Designer(
      {required this.id,
      required this.img,
      required this.name,
      required this.fee,
      required this.rate,
      required this.reviewCount,
      required this.biography,
      required this.location,
      required this.experience,
      required this.bookmark});
  factory Designer.fromJson(Map<String, dynamic> json) {
    return Designer(
        id: json['id'] ?? '',
        img: json['img'] ?? '',
        name: json['name'] ?? '',
        fee: json['fee'] ?? '',
        rate: json['rate'] ?? '',
        reviewCount: json['review_count'] ?? '',
        biography: json['bio'] ?? '',
        location: json['location'] ?? '',
        experience: json['experience'] ?? '',
        bookmark: json['bookmark'] ?? false);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'img': img,
        'name': name,
        'fee': fee,
        'rate': rate,
        'review_count': reviewCount,
        'bio': biography,
        'location': location,
        'experience': experience,
        'bookmark': bookmark
      };
}
