class DataFurniture {
  final List<Furniture> data;
  DataFurniture({required this.data});

  factory DataFurniture.fromJson(Map<String, dynamic> json) => DataFurniture(
      data:
          List<Furniture>.from(json["data"].map((x) => Furniture.fromJson(x))));
  Map<String, dynamic> toJson() =>
      {"data": List<dynamic>.from(data.map((e) => e.toJson()))};
}

class Furniture {
  final String id;
  final String img;
  final String name;
  final String desc;
  final String rate;
  final double price;
  final double? discountPrice;
  final bool bookmark;
  final String category;
  Furniture(
      {required this.id,
      required this.img,
      required this.name,
      required this.desc,
      required this.rate,
      required this.price,
      required this.discountPrice,
      required this.bookmark,
      required this.category});
  factory Furniture.fromJson(Map<String, dynamic> json) {
    return Furniture(
        id: json['id'] ?? '',
        img: json['img'] ?? '',
        name: json['name'] ?? '',
        desc: json['desc'] ?? '',
        rate: json['rate'] ?? '',
        price: json['price'] ?? 0.0,
        discountPrice: json['discount_price'] ?? 0.0,
        bookmark: json['bookmark'] ?? false,
        category: json['category'] ?? '');
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
        "name": name,
        "desc": desc,
        "rate": rate,
        "price": price,
        "discount_price": discountPrice,
        "bookmark": bookmark,
        "category": category
      };
}
